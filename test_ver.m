%%
clc;
close all;


%path = 'C:\Users\Jan Heimann\Desktop\Jade Hochschule\SoSe 15\Matlab++\Aufgabe 1\timit\TIMIT MIT';   %Jan
path = '/Users/andimeu/Documents/FH/6. Semester/DALGO/DALGO_PROJEKT/TIMIT MIT';   %Philip


TextFile = 'allfilelist.txt';
fid = fopen(TextFile);
%scans the content of the text document into an array in column order
xx = textscan(fid, '%s'); 

%sztext1 = fprintf('%s',z);

fclose(fid);
info = cd

%%
%fo = dir(strcat(path, '\', '*.txt')); % Windows User
fo = dir(strcat(path, '/', '*.txt')); % Mac User
for kk=1:3
    
    %folderlist = dir(strcat(path, '/', 'regexpdr........')); % Mac User
    path = strcat(cd, '/', 'dr1-fvmh0');
    folderlist = regexp(fo{kk},'dr.......','match');

    %fo = dir(strcat(path, '\', '*.txt')); % Windows User
    fo = [fo dir(strcat(path, '/', '*.txt'))]; % Mac User
    
end