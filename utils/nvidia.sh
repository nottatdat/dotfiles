gpufan() {
    fan1="$((2 * $1))"
    fan2="$((2 * $1 + 1))"
    DISPLAY=:1 nvidia-settings -a "[gpu:$1]/GPUFanControlState=1" \
                               -a "[fan:$fan1]/GPUTargetFanSpeed=$2" \
                               -a "[fan:$fan2]/GPUTargetFanSpeed=$3"
}
