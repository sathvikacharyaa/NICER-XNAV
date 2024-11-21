#!/bin/bash

# Define the paths and parameters
indir="/home/sathvik/nicer/PSR_B0531+21/1013010115/xti/event_cl"
infile="$indir/myspectrum.pha"
outfile="$indir/myspectrum_grp25.pha"
respfile="$indir/ni1013010115mpu7_bg.rmf"
grouptype="optmin"
groupscale="25"

# Run the ftgrouppha command
ftgrouppha "$infile" "$outfile" grouptype="$grouptype" groupscale="$groupscale" respfile="$respfile"

# Check the status of the ftgrouppha command
if [ $? -eq 0 ]; then
    echo "ftgrouppha executed successfully. Output file: $outfile"
else
    echo "ftgrouppha failed. Please check the input parameters."
    exit 1
fi

# Run XSPEC to load and plot the grouped spectrum
xspec <<EOF
data $outfile
cpd /xs
plot ldata
quit
EOF

# Check the status of the XSPEC plot
if [ $? -eq 0 ]; then
    echo "XSPEC plot generated successfully for grouped spectrum file $outfile."
else
    echo "XSPEC plot generation failed. Please check the grouped spectrum file."
fi
