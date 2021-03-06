#!/bin/bash
#author:Waffle

######## mac_addar ############
mac_array[0]="1e:81:bf:5e:81:79"
mac_array[1]="36:18:06:69:ab:9b"
mac_array[2]="9a:35:11:94:4d:ba"
mac_array[3]="52:f9:8c:e0:dc:6a"
mac_array[4]="2e:63:fc:13:bf:60"
mac_array[5]="46:93:8c:b6:aa:43"
mac_array[6]="f8:ff:c2:35:ff:c5"
mac_array_len=${#mac_array[*]}


echo 现有${mac_array_len}个Mac地址

for ((i=0;i<${mac_array_len};i++))
do
    echo "$[i+1]: ${mac_array[$i]}"
done


echo "你想使用几号mac"
read index


reMac(){
	echo "关闭无线网卡"
	sudo /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -z
	echo "Mac地址修改为—>${mac_array[$1]}"
	sudo ifconfig en0 ether ${mac_array[$1]}
	echo "重启网卡"
	networksetup -detectnewhardware
}

reMac $[index-1]
