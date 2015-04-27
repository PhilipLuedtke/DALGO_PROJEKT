function [folder_sen] = SearchSentence(name_sen)
% function to search for a specific sentence in the database
% Usage [folder_sen] = SearchSentence(name_sen)
% Input Parameter:
%       	 name_sen: name/code of the specific sentences to search for
%
% Output Parameter:
%          folder_sen: list of the folder names where the specific 
%                      sentence is found
%------------------------------------------------------------------------ 
% Example:   
%           Input:      name_sen = 'sx123';
%           Output:     folder_sen = 'dr5-ftlg0';
%
% Author: J.Heimann, D.Popken, P.Luedtke (c) TGM @ Jade Hochschule applied 
% licence see EOF 
%
% Source: ----
%
% Version History:
% Ver. 0.01 initial create (empty)     26-Apr-2015    Initials (JH, DP, PL)
% Ver. 1.0  first implementation       26-Apr-2015    Initials (JH, DP, PL)

%% Ueberpruefung des Inputs

if isempty(regexp(name_sen,'\<s\w*\d*', 'once'))
    folder_sen = [];
    
else

%% Einage des absoluten Pfades der TIMIT MIT-Datenbank

% absoluter Pfad (Jan)
path_name = 'C:\Users\Jan Heimann\Documents\MATLAB\Dalgo\DALGO_PROJEKT\TIMIT MIT';
% absoluter Pfad (Philip)
%path_name = '/Users/andimeu/Documents/FH/6. Semester/DALGO/DALGO_PROJEKT/TIMIT MIT';

%% Auslesen der Ordner der Testpersonen mit relevanten Inhalt

% Einlesen aller File- und Folder- Namen aus der Datenbank TIMIT MIT
database = dir(path_name);

% Zaehlindex
idx = 1;

% Preallokation
folder_list = cell(size(database));

% 
for file_idx = 1:length(database)
    
    % Sucht alle Ordner der Testpersonen, kein Treffer = leere Zelle
    file_name = database(file_idx).name;
    folder_list{file_idx,1} = regexp(file_name,'dr.......','match');
    
    % Abfrage, um die Zellen mit Inhalt in ein neues Cell Array zu schreiben
    if ~isempty(folder_list{file_idx,1})
        folder(idx,1) = folder_list{file_idx,1};
        idx = idx+1;
    end
    
end

%% Suche nach dem Satz in den Ordnerstrukturen

% Spaeterer Ausgabeparameter
folder_sen = [];

% Zaehlindex
idx = 1;

% For-Schleife, um die Datenbank nach dem gewuenschten Satz zu durchsuchen
for fol_idx = 1:length(folder)
    fol_name = folder{fol_idx};
    
    % Speichert alle txt-Dateien aus einem Ordner
    file_name = dir(strcat(path_name,'\',fol_name,'\','*txt')); % WINDOWS
    %file_name = dir(strcat(path_name,'/',fol_name,'/','*txt')); % MAC  
    
    % For-Schleife, um die einzelnen Satznamen mit dem Gesuchten
    % abzugleichen
    for kk = 1:length(file_name)
        sen = file_name(kk).name;
        match_sen{kk,1} = regexp(sen, name_sen, 'match');
       
    end
    
    % Kommt der gesuchte Satz in einem Ordner vor, wird der Name des
    % Ordners in eine Ausgabeliste gespeichtert
    if find(~cellfun(@isempty, match_sen(:)))
        folder_sen{idx,1} = fol_name;
        idx = idx+1;
    end
    
end

end

%--------------------Licence ---------------------------------------------
% Copyright (c) <2015> J.Heimann, D.Popken, P.Luedtke
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