% Script to test the function SearchDatabase.m 
% Author: J. Heimann, D. Popken, P. Luedtke (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 14-Apr-2015 			 Initials (JH, DP, PL)

clear;
close all;
clc;

%------------Your script starts here-------- 

% Searching: You have to choose between a person, a word, a sentence 
% or a phonem, or you can combine them.


% Nichts übergeben = []
% Zu übergebenes Kriterium in '' 
%Word = 'a';                 % Gesuchtes Wort
Word = 'sher';
Sentence = 'sa1';           % Gesuchter Satz
%Person = 'fvmh0';          % Gesuchte Person
Person = [];
Phonem = 'epi';                % Gesuchtes Phonem

[WordOut,SentenceOut,PersonOut,PhonemOut,rec_list] = SearchDatabase(Word,Sentence,Person,Phonem);


%--------------------Licence ---------------------------------------------
% Copyright (c) <2015> J. Heimann, D. Popken, P. Luedtke
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