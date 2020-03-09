#!/bin/bash


file="/sys/class/power_supply/BAT0/capacity"

powernow=$(cat "$file")


echo $powernow



















