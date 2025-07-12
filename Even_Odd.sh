#!/bin/bash

even_odd(){
        num=$1
        if ((num % 2 == 0 )); then
                echo "$num is even number"
        else
                echo "$num is odd number"
        fi
}
even_odd $1
