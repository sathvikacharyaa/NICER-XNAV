#!/bin/bash

# Define the path to the input file
indir="/home/sathvik/nicer/PSR_B0531+21/1013010115/xti/event_cl"
infile="$indir/myspectrum.pha"

# Define the syserrfile parameter
syserrfile="CALDB"

# Run the niphasyserr command
niphasyserr infile="$infile" syserrfile="$syserrfile"

# Check the status of the niphasyserr command
if [ $? -eq 0 ]; then
    echo "niphasyserr executed successfully for $infile with syserrfile $syserrfile."
else
    echo "niphasyserr failed. Please check the input file and syserrfile."
    exit 1
fi

# Run fplot to plot the graph
fplot "$infile" <<EOF
CHANNEL
SYS_ERR
-
/xs
scr white
r y 0 0.04
EOF

# Check the status of the fplot command
if [ $? -eq 0 ]; then
    echo "Systematic error plot generated successfully for $infile."
else
    echo "Plot generation failed. Please check the input file and fplot parameters."
fi
