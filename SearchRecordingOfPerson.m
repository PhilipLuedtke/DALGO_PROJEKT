function [folder_per, rec_list] = SearchRecordingOfPerson(name_per)
% function to do search the file with the recordings of a testperson
% Usage [out_param] = SearchRecordingOfPerson(in_param)
% Input Parameter:
%	 per_name: 		 
% Output Parameter:
%	 folder_per:
%    rec_list:
%------------------------------------------------------------------------ 
% Example: Provide example here if applicable (one or two lines) 

% Author: J.Heimann, D.Popken, P.Luedtke (c) TGM @ Jade Hochschule applied 
% licence see EOF 
% Source: ---
%
% Version History:
% Ver. 0.01 initial create (empty)    25-Apr-2015     Initials (JH, DP, PL)
% Ver.  1.0 first implementation      25-Apr-2015     Initials (JH, DP, PL)



%% Einage des absoluten Pfades der TIMIT MIT-Datenbank

% absoluter Pfad (Jan)
%path_name = 'C:\Users\Jan Heimann\Documents\MATLAB\Dalgo\DALGO_PROJEKT\TIMIT MIT';
% absoluter Pfad (Philip)
path_name = '/Users/andimeu/Documents/FH/6. Semester/DALGO/DALGO_PROJEKT/TIMIT MIT';
%%

% Einlesen aller File- und Folder- Namen aus der aus der Datenbank 
% TIMIT MIT
database = dir(path_name);

% Zaehlindex
idx = 1;

% Preallokation ...
folder_list = cell(size(database));

% 
for file_idx = 1:length(database)
    
    file_name = database(file_idx).name;
    folder_list{file_idx,1} = regexp(file_name,'dr.......','match');
    
    if ~isempty(folder_list{file_idx,1})
        folder(idx,1) = folder_list{file_idx,1};
        idx = idx+1;
    end
    
end

%%

% Sucht den Ordner der gesuchten Person
match_per = regexp(folder(:,1), name_per, 'match'); 

% Gibt die Position aus
pos =  find(~cellfun('isempty',match_per));


folder_per = folder{pos,:};

%% Suche aller Audioaufnahmen im Ordner der gesuchten Person

%audio_file = dir(strcat(path_name,'\',folder_per,'\','*wav')); % WINDOWS 
audio_file = dir(strcat(path_name,'/',folder_per,'/','*wav')); % MAC

rec_list = cell(size(audio_file));

for kk = 1:length(audio_file)
    
    rec = audio_file(kk).name;
    
    rec_list{kk,1} = rec;
    
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