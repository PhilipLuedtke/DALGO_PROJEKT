% Script to test the function SearchSentence.m 
% Author: J.Heimann, D.Popken, P.Luedtke (c) TGM @ Jade Hochschule applied 
% licence see EOF 
%
% Version History:
% Ver. 0.01 initial create (empty)     26-Apr-2015    Initials (JH, DP, PL)
% Ver. 1.0  first implementation       26-Apr-2015    Initials (JH, DP, PL)

clear;
close all;
clc;

name_sen = 'sa2';

[folder_sen] = SearchSentence(name_sen);

if isempty(folder_sen)
    errordlg('ERROR: Dieser Satz ist nicht bestandteil der Datenbank. Bitte ueberpruefen Sie noch einmal die Eingabe')
else    
    fprintf('\nDer Satz mit dem Kuerzel "%s" findet sich in folgenden Ordner/n wieder:\n\n', name_sen);
    fprintf('%s\n', folder_sen{:});
    fprintf('\n\n');
    
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