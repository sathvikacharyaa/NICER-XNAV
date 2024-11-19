#!/bin/bash

# Define the input path and file
indir="/home/sathvik/nicer/PSR_B0531+21/1013010115/xti/event_cl"
infile="$indir/ni1013010115_0mpu7_cl.evt"

# Define the output spectrum file
outfile="myspectrum.pha"

# Run the niextspect command
niextspect infile="$infile" outfile="$outfile"

# Check the status of the command and print a message
if [ $? -eq 0 ]; then
    echo "Spectrum successfully generated: $outfile"
else
    echo "Failed to generate spectrum. Check the input file and directory."
fi
