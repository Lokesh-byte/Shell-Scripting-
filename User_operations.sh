#!/bin/bash

add_user() {
        name=$username
        pswd=$password
        sudo useradd "$name"
        if [ $? -eq 0 ]; then
                echo "user added successfully"
        else
                echo "Some error in adding user"
        fi
}

delete_user() {
        name=$username
        users=($(cut -d: -f1 /etc/passwd))
        for i in ${users[@]}
        do
                if [ "$name" = "$i" ]; then
                        userdel "$i"
                        if [ $? -eq 0 ]; then
                                echo "User $i deleted successfully"
                        fi
                fi
        done

}
list_user() {
        awk -F: '{print $1}' /etc/passwd
}

echo "Please select operations to perform:"
operation=( "Add user" "Delete user" "List all Users" )
select option in "${operation[@]}"
do
        case $REPLY in
                1)
                        read -p "Enter username" username
                        read -p "Enter password" password
                        add_user
                        ;;
                2)
                        read -p "Enter username to delete" username
                        if [ -z "$username" ]; then
                                echo "Please enter username to proceed"
                                 read -p "Enter username to delete" username
                        else
                                delete_user
                        fi
                        ;;
                3)
                        echo "List of all Users in system:"
                        list_user
                        ;;
                *)
                        echo "Please enter valid operation"
                        ;;
        esac
done
