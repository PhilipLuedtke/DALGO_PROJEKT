clc
clear all
close all



fileID = fopen('allsenlist.txt');
C = textscan(fileID, '%s');
fclose(fileID);

y = 0;

for kk = 1:length(C{1})
    varout = C{1}{kk}'';
    y = [y ' ' varout];
    
end

x = regexp(y,'dr[0-9]','start');
x2 = regexp(y,'she','start');


for kk=1:length(x2)
   for nn=1:length(x)
       PosMatrix(kk,nn) = x2(kk)-x(nn);     
      
   end
    
end

[a,b] = size(PosMatrix);

for kk=1:a
    d(kk,:) = PosMatrix(kk,:)>0;
    
end






% %
% M = dlmread('TIMIT MIT\dr1-fvmh0\sa1.txt','\b');