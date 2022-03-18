#! /bin/bash
echo "CPU AND MEMORY RESOURCES ----------------------------"
echo "      "
echo "CPU Load Average:   "
uptime | awk '{ for (i=8; i <= 10; ++i) printf $i" "; print""}'
echo "Free RAM:"
cat /proc/meminfo | sed -n '2p' | awk '{ for (i=2; i <=4; ++i) printf $i" "; print""}'
echo "    "
echo "NETWORK CONNECTIONS ----------------------------------"
echo "lo Bytes Received:"
ifconfig | sed -n 14p | awk '{print $5}'
echo "lo Bytes Transmitted:"
ifconfig | sed -n 16p | awk '{print $5}'
echo "   "
echo "enp0s3 Bytes Received:"
ifconfig | sed -n 5p | awk '{print $5}'
echo "enp0s3 Bytes Transmitted:"
ifconfig | sed -n 7p | awk '{print $5}'
echo "   "
echo "Internet Connectivity"
if ping -c 1 www.google.com > /dev/null
then
        echo "yes"
else
        echo "no"
fi
echo "     "
echo "ACCOUNT INFORMATION ----------------------------------"
echo "    "
echo "Total Users:"
cat /etc/passwd | wc -l 
echo "Number Active:"
ps -eaho user | sort -u | wc -l
echo 'Shells'
echo "/sbin/nologin:"
cat /etc/passwd | grep /sbin/nologin | wc -l
echo "/bin/bash:"
cat /etc/passwd | grep /bin/bash | wc -l
echo "/bin/false:"
cat /etc/passwd | grep /bin/false | wc -l

echo "Filesystem Information"
echo "Total Number of Files"
cd /
echo */ | wc | awk '{print $3}'
echo "Total Number of Directories"
echo */ | wc | awk '{print $2}'
