clc
clear all
close all
% -------------------------------------------------------------------------


fileID = fopen('allsenlist.txt');
C = textscan(fileID, '%s');
fclose(fileID);

y = 0;

for kk = 1:length(C{1})
    varout = C{1}{kk}'';
    y = [y varout];
    
end

x = regexp(y,'dr[0-9]','start');
x2 = regexp(y,'she','start');       % Sätze nach Wort durchsuchen

% Ordner suchen und in Matrix speichern:-----------------------------------
MatchingFolder = 0;
for kk=1:length(x)
       Folder = y(x(kk):x(kk)+8);
       MatchingFolder = [MatchingFolder ';' Folder];
end

% TO DO:
% Subtraktion der Faktoren 


% 
% [a,b] = size(PosMatrix);
% 
% for kk=1:a
%     d(kk,:) = PosMatrix(kk,:)>0;
%     
% end
% 