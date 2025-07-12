#!/bin/bash

del_file(){
        read -p "Enter file name to delete: " file
        if [ -f "$file" ]; then
                read -p "Are you sure do you want to delete file $file (y/n):" decision
                if [ $decision = y ]; then
                        rm "$file"
                        if [ $? -eq 0 ]; then
                                echo "File $file deleted successfully!"
                        else
                                echo "OOPS!! Some error occured in deleting file"
                        fi
                else
                        echo "File not deleted as you said no"
                fi
        else
                echo "Please give valid file name to delete"
        fi

}

del_file                                                                                                           ~         
