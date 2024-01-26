#!/bin/bash 
#             XXII.IV.MMXXIII.BC DECEBAL.V.NISIPEANU.
#USAGE! Copy this file in: /etc/profile.d/ Directory.
hrs=$(date +%H) #hours.
min=$(date +%M) #minutes.
sec=$(date +%S) #seconds.
nas=$(date +%N) #nanoseconds.
dom=$(date +%d) #day of month.
dow=$(date +%w) #day of week.
won=$(date +%U) #no. of week.
won_left=$((52 - $won)) #no. of weeks left.
mon=$(date +%m) #no. of month.
mon_left=$((12 - $mon)) #no. of month left.
doy=$(date +%j) #day of year.
doy_left=$((365 - $doy)) #days of year, left.
noy=$(date +%Y) #no. of year.
dim=$(($hrs * 60 + $min)) #day in minutes.
min_pass=$((1440 - $dim)) #min left.
dis=$(($dim * 60 + $sec)) #day in seconds.
did=$(($dis / 240)) #day in degree.
yim=$(($doy * 1440 + $dim)) #year in minutes.
yis=$(($doy * 86400 + $dis)) #year in seconds.
yih=$(($doy * 24 + $hrs)) #year in hours.
sec_left=$((86400 - $dis)) #seconds left.
#SUMERIAN==================================================================================================================================
diss=$(($dis / 2)) #day in sumerian sec.
dism=$(($diss / 60)) #day in sumerian sec.
dish=$(($dism / 60)) #day in sumerian hrs.
sm=$(($dism - $dish * 60)) #sumerian min.
ss=$(($diss - $dism * 60)) #sumerian sec.
sn=$(($nas /2)) #sumerian nano.
#==========================================================================================================================================
km_sec=$(($dis * 0,463831018519)) #planet rev. in km/s
kmsec=$((40075 - $km_sec)) #km left 
hrs_left=$((24 - $hrs)) #hrs left
min_left=$((1440 - $dim)) #min left
#==========================================================================================================================================
age_years=$(($noy - 1976)) #my age in years 
age_hrs=$((8766 * $age_years + $doy * 24 - 140 * 24 - 2)) #my age in hours
age_days=$(($age_hrs / 24)) #my age in days
age_minutes=$(($age_hrs * 60 + $min - 120)) #my age in minutes
age_seconds=$(($age_minutes * 60 + $sec + 20)) #my age in seconds
age_deg=$(($age_seconds / 240 + $did)) #my age in degree
age_rad=$(($age_deg / 57,2957795)) #my age in radians
#==========================================================================================================================================
date_in_degree=$(($noy * 131490 + $did)) #date in degree
date_in_hrs=$(($noy * 8766 + $yih)) #date in hrs
date_in_min=$(($date_in_hrs * 60 + $min)) #date in min
date_in_sec=$(($date_in_min * 60 + $sec)) #date in sec

########################################################################################################################################### 
header="\n%26s%10s%20s" # Setup Print(f) header
format="\n%10s\n" # Setup Print(f) format
###########################################################################################################################################

printf "$header" "[D]$doy:[R]$did°:[T]$hrs:$min:$sec."
printf "[LifeTime]::$age_years.Years||$age_days.Days||$age_hrs.Hours&$min.Minutes"
#SetPasswd:
syspasswd=$doy$did$hrs$min$sec
#PrintOutput
echo " "
echo " "
read -p "Enter Password :  " inputpasswd
if [ "$inputpasswd" = "$syspasswd" ]; then
printf "$format" "Password [ ACCEPTED! ]"
sleep 1; clear; echo "[ The SHELL Is READY ]  [ YO HAVE THE CONTROL ]  [ Sys.Time: JD$doy:R$did° ]";
else
exit 1
fi
