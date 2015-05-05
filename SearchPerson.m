function [folder_per] = SearchPerson(name_per)
% function to search the folder of a test person
% Usage [folder_per] = SearchPerson(name_per)
% Input Parameter:
%               per_name:   name/code of the test person to search for
% Output Parameter:
%               folder_per: name of the test person's folder
%------------------------------------------------------------------------
% Example:
%           Input:      name_per = 'marc0';
%           Output:     folder_per = 'dr2-marc0';
%
% Author: J.Heimann, D.Popken, P.Luedtke (c) TGM @ Jade Hochschule applied
% licence see EOF
% Source: ---
%
% Version History:
% Ver. 0.01 initial create (empty)    03-May-2015     Initials (JH, DP, PL)
% Ver. 1.0 first implementation       03-May-2015     Initials (JH, DP, PL)


%% Ueberpruefung des Inputs

if isempty(regexp(name_per,'\w*...\d*', 'once'))
    folder_per = [];
    
else
    %% Eingabe des Pfades der TIMIT MIT-Datenbank
    
    path_name = '..\TIMIT MIT';
    
    %% Auslesen der Ordner der Testpersonen mit relevanten Inhalt
    
    % Einlesen aller File- und Folder- Namen aus der aus der Datenbank
    % TIMIT MIT
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
    
    %% Suche nach dem Ordner der Testperson
    
    % Sucht den Ordner der gesuchten Person
    match_per = regexp(folder(:,1), name_per, 'match');
    
    if find(~cellfun(@isempty, match_per))
        % Gibt die Position aus
        pos =  find(~cellfun('isempty',match_per));
        
        % Speichert den gefundenen Namen ab
        folder_per = folder{pos,:};
        
    else
        folder_per = [];
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