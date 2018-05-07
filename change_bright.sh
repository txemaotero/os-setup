update_value(){
	local filename="/sys/class/backlight/intel_backlight/brightness"
	local prev=$(cat $filename)
	local step=$1
	local new=$(( prev + step ))
	if [ $new -gt 900 ]; then
		new=900
	fi
	if [ $new -lt 20 ]; then
		new=20
	fi
	echo $new > $filename
}

update_value $1
