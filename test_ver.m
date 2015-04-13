%%


path = 'C:\Users\Jan Heimann\Desktop\Jade Hochschule\SoSe 15\Matlab++\Aufgabe 1\timit\TIMIT MIT';


TextFile = 'allfilelist.txt';
fid = fopen(TextFile);
%scans the content of the text document into an array in column order
xx = textscan(fid, '%s'); 

%sztext1 = fprintf('%s',z);

fclose(fid);


%%

fo = dir(strcat(path, '\', '*.txt'));

