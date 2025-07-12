#!/bin/bash

Max_Limit=80
Current_usage=$(df -h | grep drivers | awk '{print $5}' | cut -d% -f1)

disk_usage(){
        if [ $Current_usage -gt $Max_Limit ]; then
                echo "Disk usage exceeded than the maximum limit please take necessary action"
        else
                echo "Disk usage is normal: $Current_usage"
        fi
}

disk_usage
