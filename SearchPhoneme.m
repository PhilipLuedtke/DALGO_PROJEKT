function [new_result_phn] = SearchPhoneme(phn)
% function to search for a specific phoneme in the database
% Usage [result_phn] = SearchPhoneme(phn)
% Input Parameter:
%                 phn: name of the phoneme to search for
% Output Parameter:
%          result_phn: list of the folder names and its sentences where the
%                      specific phoneme is found
%------------------------------------------------------------------------
% Example:
%           Input:      phn = 'epi';
%           Output:     result_phn =
%
% Author: J.Heimann, D.Popken, P.Luedtke (c) TGM @ Jade Hochschule applied
% licence see EOF
% Source: If the function is based on a scientific paper or a web site,
% provide the citation detail here (with equation no. if applicable)
%
% Version History:
% Ver. 0.01 initial create (empty)     27-Apr-2015    Initials (JH, DP, PL)
% Ver. 1.0  first implementation       28-Apr-2015    Initials (JH, DP, PL)


%% Eingabe des Pfades der TIMIT MIT-Datenbank


path_name = '..\DALGO_PROJEKT\TIMIT MIT';

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

%% Nach dem gewuenschten Phonem suchen

% Spaeterer Ausgabeparameter
result_phn = cell(1,2);
list = [];
% For-Schleife, um die Datenbank nach dem gewuenschten Satz zu durchsuchen
for fol_idx = 1:length(folder)
    fol_name = folder{fol_idx};
    
    % Einlesen aller .phn-Dateien

    file = dir(strcat(path_name,'\',fol_name,'\','*.phn')); % WINDOWS
%     file = dir(strcat(path_name,'/',fol_name,'/','*.phn')); % MAC
    
    % Zaehlindex
    idx = 1;

    for kk = 1:length(file)
        
        %
        fid = fopen(file(kk).name);
        phn_data = textscan(fid, '%d %d %s');
        fclose(fid);
        
        list_phn = phn_data{1,3};
        
        match_phn = regexp(list_phn(:,1), phn, 'match');
        if find(~cellfun(@isempty, match_phn(:)))
            list{idx,1} = file(kk).name;
            idx = idx+1;
        end
    end

    result_phn{fol_idx,1} = fol_name;
    result_phn{fol_idx,2} = list;
end

% Die Ausgabe wird neu sortiert und enth�lt nun statt eines Cell-Arrays mit
% mehreren Ebenen nur noch eine Liste. Dies ist wichtig f�r die Funktion
% 'output_data'

% Dieser Schritt h�tte vermieden werden k�nnen und ist sicherlich sehr unelegant
new_result_phn = {};

for nn = 1:length(result_phn)
    
   if ~isempty(result_phn{nn,2})
       
       mem_right = result_phn{nn,2};
       
       for mm = 1:length(mem_right)
          content = [result_phn{nn,1} mem_right{mm}];
          
          new_result_phn = [new_result_phn; content];
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