#!/bin/bash

print_array(){
        arr=($@)
        for i in ${arr[@]}
        do
                if [ $i -eq 5 ]; then
                        continue
                fi
                echo $i
        done
}

print_array 1 2 3 4 5 6
