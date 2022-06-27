#!/bin/sh
FILE=$(ls /sys/class/power_supply/ | grep "hidpp_battery_")
if [ $? -eq 1 ]; then
    echo "%{u#c795ae}%{+u}  "
    exit
fi
STATUS=$(grep "ONLINE" /sys/class/power_supply/$FILE/uevent | cut -d"=" -f2)
if [ "$STATUS" -eq "0" ]; then
    echo "%{u#c795ae}%{+u}  "
    exit
fi
MOUSE_VOLTAGE=$(grep "VOLTAGE" /sys/class/power_supply/$FILE/uevent | cut -d"=" -f2)
MOUSE_VOLTAGE=$(expr $MOUSE_VOLTAGE / 1000)
declare -a VOLTAGES=(
    4186 4156 4143 4133 4122 4113 4103 4094 4086 4075
    4067 4059 4051 4043 4035 4027 4019 4011 4003 3997
    3989 3983 3976 3969 3961 3955 3949 3942 3935 3929
    3922 3916 3909 3902 3896 3890 3883 3877 3870 3865
    3859 3853 3848 3842 3837 3833 3828 3824 3819 3815
    3811 3808 3804 3800 3797 3793 3790 3787 3784 3781
    3778 3775 3772 3770 3767 3764 3762 3759 3757 3754
    3751 3748 3744 3741 3737 3734 3730 3726 3724 3720
    3717 3714 3710 3706 3702 3697 3693 3688 3683 3677
    3671 3666 3662 3658 3654 3646 3633 3612 3579 3537
    3500)

for i in "${!VOLTAGES[@]}"
do
    if [ $(expr "$MOUSE_VOLTAGE > ${VOLTAGES[$i]}") ]; then
        PERCENTAGE=$(expr 100 - $i)
        echo "%{u#aec795}%{+u}  $PERCENTAGE% "
        exit
    fi
done
