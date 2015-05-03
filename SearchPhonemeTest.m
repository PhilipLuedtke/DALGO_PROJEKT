% Script to test the function SearchPhoneme.m
% Author: J.Heimann, D.Popken, P.Luedtke (c) TGM @ Jade Hochschule applied
% licence see EOF
%
% Version History:
% Ver. 0.01 initial create (empty)     27-Apr-2015    Initials (JH, DP, PL)
% Ver. 1.0  first implementation       28-Apr-2015    Initials (JH, DP, PL)

clear;
close all;
clc;

phn = 'epi';

[result_phn] = SearchPhoneme(phn);

isempty = cellfun('isempty',result_phn);
if isempty(1,2) == 1
    errordlg('ERROR: Dieses Phonem ist nicht Bestandteil der Datenbank. Bitte ueberpruefen Sie noch einmal die Eingabe')
else
    
    person = result_phn(:,1)   % Sucht die Personen, bei denen das Phonem auftaucht
    satz = result_phn(:,2);
    for kk = 1 : length(satz)
        disp(strvcat(satz{kk}))
    end
    
end

%% TO-DO:
% Funktion läuft soweit und kann auch auf Fehler überprüfen! Muss nun noch
% in die Main-Fkt. eingebaut werden!!
%%


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