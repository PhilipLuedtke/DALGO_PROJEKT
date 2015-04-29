function [ausgabe] = SearchWord(word)
% function to do something usefull (fill out)
% Usage [out_param] = SearchWord(in_param)
% Input Parameter:
%	 word: 		 word is the string which is searched
% Output Parameter:
%	 ausgabe: 	 ausgabe is the list of all sentences which contain the
%	 searched word including dialect region and speaker, which is equal to
%	 the name of the data (txt or wav)
%------------------------------------------------------------------------

% Author: J. Heimann, P. Luedtke, D. Popken (c) TGM @ Jade Hochschule applied licence see EOF
% Source: If the function is based on a scientific paper or a web site,
%         provide the citation detail here (with equation no. if applicable)
% Version History:
% Ver. 0.01 initial create (empty) 25-Apr-2015  Initials (JH PL DP)

%------------Your function implementation here---------------------------
% eingrenzen der Suche auf das Wort, wichtig für besonders kurze Worte z.B.
% 'a', 'is' oder 'an'
word_manip = sprintf('^%s$',word);

% txtfile allsenlist wird einglesen und in 'C' gespeichert
fileID = fopen('allsenlist.txt');
C = textscan(fileID, '%s');
fclose(fileID);

% Alle in C enthaltenen Woerter werden in 'y' gespeichert und durch ein
% Leerzeiche getrennt
y = 0;
for kk = 1:length(C{1})
    varout = C{1}{kk}'';
    y = [y ' ' varout];
end

% Die Woerter werden einzelnd in 'result' abgespeichert, das Leerzeichen aus 'y' wird
% dabei eleminiert
result = [];
result = strsplit(y,' ');
result = result(2:end);

% in 'x' werden alle Dateinamen gefunden, 'x2' findet das gesuchte Wort.
x = regexp(result,'dr[0-9]','tokens');
x2 = regexp(result,word_manip,'match');

% 'x' und 'x2' enthalten leere Elemente, 'pos' und 'pos2' finden alle
% Elemente, die nicht leer sind und gibt deren Position an
pos = find(~cellfun('isempty',x));
pos2 = find(~cellfun('isempty',x2));
if ~isempty(pos2)
    % alle nicht leeren Positionseinträge aus 'pos' und 'pos2' werden
    % voneinander subtrahiert, die Ergebnisse werden in der Matrix 'PosMatrix'
    % abgespeichert. 'PosMatrix' hat die Größe (Anzahl der gefundenen Wörter x Anzahl der Sätze)
    for kk=1:length(pos2)
        for nn=1:length(pos)
            PosMatrix(kk,nn) = pos2(kk)-pos(nn);
        end
    end
    
    % Jede Zeile von 'PosMatrix' enthält einen Eintrag, der es ermöglicht dem
    % gesuchten Wort den gesuchten Satz zuzuweisen
    [a,b] = size(PosMatrix);
    
    % 'PosMatrix' wird zeilenweise nach dem Eintrag mit der kleinsten positiven
    % Zahl durchsucht
    var = 0;
    for kk = 1:a
        pos_oder_neg = PosMatrix(kk,:)>=0; % Matrix Zeilenweise durchlaufen (logic(1 oder 0))
        groesste_neg = find(pos_oder_neg==0); % Position der ersten Null ist die größte negative Zahl
        kleinste_pos = min(groesste_neg)-1; % Vorherige Position -1 ist die kleinste positive Zahl
        answer = result(pos(kleinste_pos)); % die Zahl gibt die Position aus pos an in der die Position in result steht
        var = [var; answer]; % Alle Antworten in einem Vektor
    end
    
    ausgabe = var(2:end); % Erster Eintrag ist 'var = 0', daher Ausgabe von (2:end)
    
else
    ausgabe = sprintf('word not found');
end
%--------------------Licence ---------------------------------------------
% Copyright (c) <2015> J. Heimann, P. Luedtke, D. Popken
% Jade University of Applied Sciences
% Permission is hereby granted, free of charge, to any person obtaining
% a copy of this software and associated documentation files
% (the "Software"), to deal in the Software without restriction, including
% without limitation the rights to use, copy, modify, merge, publish,
% distribute, sublicense, and/or sell copies of the Software, and to
% permit persons to whom the Software is furnished to do so, subject
% to the following conditions:
% The above copyright notice and this permission notice shall be included
% in all copies or substantial portions of the Software.
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
% OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
% CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
% TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.