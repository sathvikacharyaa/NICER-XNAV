#!/bin/bash

# Define the input directory
indir="/home/sathvik/nicer/PSR_B0531+21/1013010115"

# Run the nicerl3-spect command
nicerl3-spect "$indir" clobber=YES

# Check the status of the command and print a message
if [ $? -eq 0 ]; then
    echo "nicerl3-spect executed successfully for $indir."
else
    echo "nicerl3-spect failed for $indir."
fi




