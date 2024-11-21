#!/bin/bash

# Define the path to the input file
indir="/home/sathvik/nicer/PSR_B0531+21/1013010115/xti/event_cl"
infile="$indir/myspectrum.pha"

# Define the noticerange parameter
noticerange="22:1501"

# Run the niphaquality command
niphaquality infile="$infile" noticerange="$noticerange"

# Check the status of the niphaquality command
if [ $? -eq 0 ]; then
    echo "niphaquality executed successfully for $infile with noticerange $noticerange."
else
    echo "niphaquality failed. Please check the input file and parameters."
    exit 1
fi

# Run fplot to plot the graph
fplot $infile <<EOF
CHANNEL
QUALITY
-
/xs
scr white
p
EOF

# Check the status of the fplot command
if [ $? -eq 0 ]; then
    echo "Plot generated successfully for $infile."
else
    echo "Plot generation failed. Please check the input file and fplot parameters."
fi
