#!/bin/bash

datafile="/home/sathvik/nicer/PSR_B0531+21/1013010115/xti/event_cl/ni1013010115mpu7_sr.pha"
rmffile="/home/sathvik/nicer/PSR_B0531+21/1013010115/xti/event_cl/ni1013010115mpu7.rmf"
arffile="/home/sathvik/nicer/PSR_B0531+21/1013010115/xti/event_cl/ni1013010115mpu7_sk.arf"

# Run XSPEC and load the necessary files before plotting
xspec <<EOF
data $datafile
response $rmffile
arf $arffile
cpd /xs
setplot energy
setplot rebin 10 10
plot ldata
quit
EOF

echo "XSPEC plot generated for data file $datafile."

