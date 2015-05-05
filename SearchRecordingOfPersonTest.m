% Script to test the function SearchRecordingOfPerson.m 
% Author: J.Heimann, D.Popken, P.Luedtke (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty)      25-Apr-2015   Initials (JH, DP, PL)
% Ver. 1.0  first implementation        25-Apr-2015   Initials (JH, DP, PL)

clear;
close all;
clc;

% Bitte Kuerzel der gesuchten Testperson eingeben, bsp marc0
name_per = 'faem0';

% Aufruf der Fkt SearchRecordingOfPerson
[folder_per, rec_list] = SearchRecordingOfPerson(name_per);

if isempty(folder_per)
    errordlg('ERROR: Die gesuchte Person ist nicht bestandteil dieser Datenbank. Bitte ueberpruefen Sie noch einmal die Eingabe')
else 
% Ausgabe des Ergebnis im Command Window
fprintf('\n\nDie Aufnahmen der Person mit\ndem Kuerzel "%s" finden Sie im Datenordner "%s"\nDie entsprechenden Audioaufnahmen lauten:\n\n', name_per, folder_per);
fprintf('%s\n', rec_list{:});
fprintf('\n');

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