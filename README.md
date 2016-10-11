# HEKA-Data-Extraction

Matlab script to extract conductance values, time, and comments from
multiple HEKA data (.hkr) files in one folder.

First put all IV curve data files from which you would like to extract
the conductance in one folder. Make sure to delete/move all other files 
in the folder that are not in the '.hkr' format.

Place the script in the folder and run it.

The output is an 1xn struct (labeled 'Output') where the first field 
is conductance, the second field is the corresponding time, and the
third field is a comment (i.e. the file name). These values can be copied to
Excel, SigmaPlot, Origins, etc.
