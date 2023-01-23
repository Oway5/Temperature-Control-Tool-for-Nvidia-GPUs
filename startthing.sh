#!/bin/bash
export DISPLAY=:0
#echo $DISPLAY
while :
do
    nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader -f /home/oways/Desktop/temp.txt
    sleep 2
    while read -r line; do
    nick=$line
    #echo $nick
    if [ $nick -lt 43 ]
    then
        nvidia-settings -a "[fan:0]/GPUTargetFanSpeed=0"
        nvidia-settings -a "[fan:1]/GPUTargetFanSpeed=0"
        
    fi
    if [ $nick -lt 46 ] && [ $nick -gt 43 ]
    then
        nvidia-settings -a "[fan:0]/GPUTargetFanSpeed=38"
        nvidia-settings -a "[fan:1]/GPUTargetFanSpeed=38"
        
    fi
    if [ $nick -lt 48 ] && [ $nick -gt 46 ]
    then
        nvidia-settings -a "[fan:0]/GPUTargetFanSpeed=54"
        nvidia-settings -a "[fan:1]/GPUTargetFanSpeed=54"
        
    fi
    if [ $nick -lt 50 ] && [ $nick -gt 48 ]
    then
        nvidia-settings -a "[fan:0]/GPUTargetFanSpeed=71"
        nvidia-settings -a "[fan:1]/GPUTargetFanSpeed=71"
        
    fi
    if [ $nick -lt 55 ] && [ $nick -gt 50 ]
    then
        nvidia-settings -a "[fan:0]/GPUTargetFanSpeed=86"
        nvidia-settings -a "[fan:1]/GPUTargetFanSpeed=86"
        
    fi
    if [ $nick -lt 68 ] && [ $nick -gt 55 ]
    then
        nvidia-settings -a "[fan:0]/GPUTargetFanSpeed=97"
        nvidia-settings -a "[fan:1]/GPUTargetFanSpeed=97"
        
    fi
    if [ $nick -gt 68 ]
    then
        nvidia-settings -a "[fan:0]/GPUTargetFanSpeed=100"
        nvidia-settings -a "[fan:1]/GPUTargetFanSpeed=100"
        
    fi
    
    done < /home/oways/Desktop/temp.txt
    #read line then compare to value then set fan speed
done
