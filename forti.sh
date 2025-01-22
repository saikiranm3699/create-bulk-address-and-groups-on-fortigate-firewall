#!/bin/bash
echo  "Enter IP address list (Space seperated).  or Press ctrl+c to exit the script" 
read -e -a ip_adresses
addressgrp=()

Write_ips_toscreen() {
        for ip in "${ip_adresses[@]}";do
            ip_parts=(${ip//// })
            ip_address="${ip_parts[0]}"
            subnet_mask="${ip_parts[1]}"
            
           
            if [[ -z  "$subnet_mask" || "$subnet_mask" == "32" ]]; then
                echo  "edit $ip_address"
                echo "set subnet $ip_address/32"
                echo "next"
                addressgrp+=( "$ip_address" )

            else
                echo "edit  $ip"
                echo "set subnet $ip"
                echo "next"
                addressgrp+=( "$ip" )
            fi

        done
echo "end"
read -e -p "Enter group name: " grpname
echo "config firewall addrgrp"
echo "edit $grpname"
echo "set member ${addressgrp[@]}"
echo "next"
echo "end"
}

echo  " "
echo -e "Output:"
echo ""

Write_ips_toscreen
