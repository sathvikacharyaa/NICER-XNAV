#!/bin/bash

# Define the input directory and output destination
indir="/home/sathvik/nicer/PSR_B0531+21/1013010115"
output_path="home/sathvik/nicer/PSR_B0531+21/$indir/xti/event_cl"

# Run the nicerl2 command and store the output directly in event_cl directory
nicerl2 indir="$indir" clobber=YES

# Check if the output from nicerl2 exists and move it to the specified path
if [ -d "$indir/xti/event_cl" ]; then
    mv "$indir/xti/event_cl"/* "$output_path/"
    echo "Files have been moved to $output_path"
else
    echo "The event_cl directory does not exist. Please check the output of nicerl2."
fi

