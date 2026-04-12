#!/bin/bash

LOG_FILE="/var/log/user_manager.log"

function log_action() {
    echo "$(date) - $1" >> $LOG_FILE
}

function enable_root_login() {
    SSH_CONFIG="/etc/ssh/sshd_config"

    sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' $SSH_CONFIG
    sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' $SSH_CONFIG

    grep -q "^PermitRootLogin" $SSH_CONFIG || echo "PermitRootLogin yes" >> $SSH_CONFIG
    grep -q "^PasswordAuthentication" $SSH_CONFIG || echo "PasswordAuthentication yes" >> $SSH_CONFIG

    systemctl restart ssh
}

function create_user_root() {
    echo "===== CREATE USER (ROOT + NOPASSWD) ====="
    read -p "Enter username: " USERNAME

    if id "$USERNAME" &>/dev/null; then
        echo "[ERROR] User already exists!"
        return
    fi

    adduser $USERNAME

    usermod -aG sudo $USERNAME
    usermod -aG root $USERNAME

    echo "$USERNAME ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME
    chmod 440 /etc/sudoers.d/$USERNAME

    log_action "CREATE USER $USERNAME"

    echo "[SUCCESS] User $USERNAME created with ROOT + NOPASSWD"
}

function change_root_password() {
    echo "===== CHANGE ROOT PASSWORD ====="

    enable_root_login

    passwd root

    log_action "CHANGE ROOT PASSWORD"

    echo "[SUCCESS] Root password updated"
}

function delete_user() {
    echo "===== DELETE USER ====="
    read -p "Enter username: " USERNAME

    if ! id "$USERNAME" &>/dev/null; then
        echo "[ERROR] User does not exist!"
        return
    fi

    pkill -u $USERNAME 2>/dev/null
    crontab -r -u $USERNAME 2>/dev/null

    rm -f /etc/sudoers.d/$USERNAME
    rm -f /var/mail/$USERNAME
    rm -f /var/spool/mail/$USERNAME

    find /tmp -user $USERNAME -exec rm -rf {} \; 2>/dev/null
    rm -rf /home/$USERNAME/.ssh

    userdel -r $USERNAME
    groupdel $USERNAME 2>/dev/null

    log_action "DELETE USER $USERNAME"

    echo "[SUCCESS] User $USERNAME removed completely"
}

function list_users() {
    echo "===== USER LIST ====="
    cut -d: -f1 /etc/passwd
}

function check_sudo_users() {
    echo "===== SUDO USERS ====="
    getent group sudo
}

function toggle_ssh_password() {
    echo "===== SSH PASSWORD LOGIN ====="
    echo "1. Enable"
    echo "2. Disable"
    read -p "Select: " opt

    if [ "$opt" == "1" ]; then
        sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
        systemctl restart ssh
        echo "[SUCCESS] Enabled"
    elif [ "$opt" == "2" ]; then
        sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
        systemctl restart ssh
        echo "[SUCCESS] Disabled"
    else
        echo "[ERROR] Invalid"
    fi
}

while true; do
    clear
    echo "========== USER MANAGEMENT =========="
    echo "1. Create User + Root (NOPASSWD)"
    echo "2. Change Root Password (Fix SSH)"
    echo "3. Delete User (Full Clean)"
    echo "4. List Users"
    echo "5. Toggle SSH Password Login"
    echo "6. Check Sudo Users"
    echo "0. Exit"
    echo "===================================="
    read -p "Select: " menu

    case $menu in
        1) create_user_root ;;
        2) change_root_password ;;
        3) delete_user ;;
        4) list_users ;;
        5) toggle_ssh_password ;;
        6) check_sudo_users ;;
        0) exit ;;
        *) echo "[ERROR] Invalid"; sleep 1 ;;
    esac
done
