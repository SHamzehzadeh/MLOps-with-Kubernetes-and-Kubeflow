#!/user/bin/bash

clear
echo '------------------------------------------------------------------------------------------------------'
echo '######################################################################################################'
echo '--------------------------------------Processes-------------------------------------------------------'
nvidia-smi pmon  -d 1 -c 1 -s um -o DT
echo '------------------------------------------------------------------------------------------------------'
echo 'More Details ?(y/n)'
read MD
if [ "$MD" != 'y' ];  then
        echo ' OK! '
        exit 1;
fi

echo '------------------------------------------------------------------------------------------------------'
echo 'Which GPU (e.g. --> 0 for GPU0 or 0,2 for GPU0 and GPU2) ?'
read GPU
clear
echo '######################################################################################################'
nvidia-smi pmon  -d 1 -c 1 -s um -o DT -i $GPU
echo '######################################################################################################'

echo '--------------------------------------GPU Temperature-------------------------------------------------'
nvidia-smi -i $GPU -q -d TEMPERATURE | grep  'GPU 00000000\|GPU Current Temp\|Memory Current Temp'
echo 'Enter toContinue ... '
read C
clear
echo '------------------------------------------------------------------------------------------------------'
echo '-------------------------------------------PIDS-------------------------------------------------------'
nvidia-smi -q -d PIDS -i $GPU | grep "GPU 00000000\|Process ID\|Used GPU Memory"
echo '------------------------------------------------------------------------------------------------------'
echo '----------------------------------------NVIDIA-SMI----------------------------------------------------'
nvidia-smi | grep "NVIDIA\|P0"
echo '######################################################################################################'
echo '------------------------------------------------------------------------------------------------------'