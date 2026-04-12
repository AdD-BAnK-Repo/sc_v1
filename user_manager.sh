#!/bin/bash

clear

function create_user_root() {
    echo "===== CREATE USER WITH ROOT ====="
    read -p "Enter username: " USERNAME

    if id "$USERNAME" &>/dev/null; then
        echo "[ERROR] User already exists!"
        return
    fi

    adduser $USERNAME

    if [ $? -ne 0 ]; then
        echo "[ERROR] Failed to create user"
        return
    fi

    usermod -aG sudo $USERNAME
    usermod -aG root $USERNAME

    echo "$USERNAME ALL=(ALL:ALL) ALL" > /etc/sudoers.d/$USERNAME
    chmod 440 /etc/sudoers.d/$USERNAME

    echo "[SUCCESS] User $USERNAME created with root privileges"
}

function change_root_password() {
    echo "===== CHANGE ROOT PASSWORD ====="
    passwd root
    echo "[SUCCESS] Root password updated"
}

function delete_user() {
    echo "===== DELETE USER (FULL CLEAN) ====="
    read -p "Enter username to delete: " USERNAME

    if ! id "$USERNAME" &>/dev/null; then
        echo "[ERROR] User does not exist!"
        return
    fi

    echo "[INFO] Killing user processes..."
    pkill -u $USERNAME 2>/dev/null

    echo "[INFO] Removing cron jobs..."
    crontab -r -u $USERNAME 2>/dev/null

    echo "[INFO] Removing user from sudoers..."
    rm -f /etc/sudoers.d/$USERNAME

    echo "[INFO] Removing mail spool..."
    rm -f /var/mail/$USERNAME
    rm -f /var/spool/mail/$USERNAME

    echo "[INFO] Removing temp files..."
    rm -rf /tmp/*$USERNAME* 2>/dev/null

    echo "[INFO] Removing SSH keys..."
    rm -rf /home/$USERNAME/.ssh

    echo "[INFO] Deleting user and home directory..."
    userdel -r $USERNAME

    echo "[INFO] Removing group (if exists)..."
    groupdel $USERNAME 2>/dev/null

    echo "[SUCCESS] User $USERNAME fully removed"
}

function list_users() {
    echo "===== USER LIST ====="
    cut -d: -f1 /etc/passwd
}

function toggle_ssh_password() {
    echo "===== SSH PASSWORD LOGIN ====="
    echo "1. Enable"
    echo "2. Disable"
    read -p "Select: " opt

    if [ "$opt" == "1" ]; then
        sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
        systemctl restart ssh
        echo "[SUCCESS] SSH Password Login Enabled"
    elif [ "$opt" == "2" ]; then
        sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
        systemctl restart ssh
        echo "[SUCCESS] SSH Password Login Disabled"
    else
        echo "[ERROR] Invalid option"
    fi
}

function check_sudo_users() {
    echo "===== SUDO USERS ====="
    getent group sudo
}

while true; do
    echo ""
    echo "========== USER MANAGEMENT =========="
    echo "1. Create User + Root"
    echo "2. Change Root Password"
    echo "3. Delete User"
    echo "4. List Users"
    echo "5. Toggle SSH Password Login"
    echo "6. Check Sudo Users"
    echo "0. Exit"
    echo "===================================="
    read -p "Select menu: " menu

    case $menu in
        1) create_user_root ;;
        2) change_root_password ;;
        3) delete_user ;;
        4) list_users ;;
        5) toggle_ssh_password ;;
        6) check_sudo_users ;;
        0) exit ;;
        *) echo "[ERROR] Invalid menu" ;;
    esac
done
