#!/bin/bash

# Define the path to the spectral data file
datafile="/home/sathvik/nicer/PSR_B0531+21/1013010115/xti/event_cl/myspectrum.pha"

# Run XSPEC and execute the required commands
xspec <<EOF
data $datafile
cpd /xs
plot ldata
quit
EOF

echo "XSPEC plot completed for data file $datafile."

