#!/bin/bash
echo "checking interrupt"

cat /proc/interrupts | grep -i dma | {
        count=0
        while read line;do
                # if [[ "$line" == *spi ]] then
                                echo $line
                                ((count++))
                # fi
        done
        if [[ $count -ge 28 ]]; then
                echo -e "\nPASSED"
                exit 0
        else
                echo -e "\nFAILED"
                exit 1
        fi
}