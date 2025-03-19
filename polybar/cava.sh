

#! /bin/bash
export PULSE_SERVER="unix:${XDG_RUNTIME_DIR}/pulse/native"

bar="▁▂▃▄▅▆▇█"
dict="s/;//g;"

# creating "dictionary" to replace char with bar
i=0
while [ $i -lt ${#bar} ]
do
    dict="${dict}s/$i/${bar:$i:1}/g;"
    i=$((i=i+1))
done

pipe="/tmp/cava.fifo"
rm -f "$pipe"  # Fuerza la eliminación si existe
mkfifo -m 600 "$pipe"  # Crea el FIFO con permisos correctos

# write cava config
config_file="/tmp/polybar_cava_config"
echo "
[general]
bars = 20
[input]
method = pulse
source = alsa_output.pci-0000_2a_00.6.analog-stereo.monitor
[output]
method = raw
raw_target = $pipe
data_format = ascii
ascii_max_range = 7
" > $config_file

# run cava in the background
cava -p $config_file &

# reading data from fifo
while read -r cmd; do
    echo $cmd | sed $dict
done < $pipe