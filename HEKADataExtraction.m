% HEKADataExtraction.m
%
% Matlab script to extract conductance values, time, and comments from
% multiple HEKA data (.hkr) files in one folder.
%
% First delete/move all other files in the folder that are not in the 
% '.hkr' format. Place the script in the folder and run it.
%
% The output is an 1xn struct where the first field is conductance, the
% second field is the corresponding time, and the third field is a 
% comment (i.e. the file name).

files = dir('*.hkr');
[rows,columns] = size(files);
Output = struct('Conductance',[],'Time','','Comment','');
for row = 1:rows
    A = importdata(files(row).name);
    
    stringsize = length(files(row).name);
    
    [rowsA,columnsA]= size(A.data);
    
    coefficients = polyfit(A.data(1:rowsA,2),A.data(1:rowsA,3),1);
    
    G = coefficients(1);
    
    t = files(row).name(stringsize-9:stringsize-4);
    
    C = files(row).name(1:stringsize-10);
    
    Output(row).Conductance = G;
    
    Output(row).Time = str2double(t);
    
    Output(row).Comment = C;
    
    % Add extra stuff here
end