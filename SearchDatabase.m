function [WordOut,SentenceOut,PersonOut,PhonemOut,rec_list] = SearchDatabase(Word,Sentence,Person,Phonem)
% function to search for a word, sentence, person or phonem, or a combination of them
% in the TIMIT MIT Database
% Usage [WordOut,SentenceOut,PersonOut,PhonemOut,rec_list] = SearchDatabase(Word,Sentence,Person,Phonem)
% Input Parameter:
%	 Word: 		 Word you are looking for
%    Sentence:   Sentence you are looking for
%    Person:     Person you are looking for
%    Phonem:     Phonem you are looking for
% Output Parameter:
%	 Wordout, SentenceOut...:   Shows the explicit folder or data in wich the
%                               keyword was found
%------------------------------------------------------------------------ 

% Author: J. Heimann, D. Popken, P. Luedtke (c) TGM @ Jade Hochschule applied licence see EOF 
% Source: If the function is based on a scientific paper or a web site, 
%         provide the citation detail here (with equation no. if applicable)  
% Version History:
% Ver. 0.01 initial create (empty) 14-Apr-2015  Initials (JH, DP, PL)
% Ver. 1.0  first implementation       27-Apr-2015    Initials (PL, DP, JH)
%------------Your function implementation here--------------------------- 

% Abfrage nach Übergabekriterien und Ausführen der Unterfunktionen:
if  ~isempty(Word) == 1
    WordOut = SearchWord(Word); % Funktionsaufruf
    % Ausgabe:
    
    
    SentenceOut = []; PersonOut = []; PhonemOut = []; rec_list = [];
end

if ~isempty(Sentence) == 1
    SentenceOut = SearchSentence(Sentence); % Funktionsaufruf
    WordOut = []; PersonOut = []; PhonemOut = []; rec_list = [];
    % Überprüft ob eingebener Satz vorhanden. Ansonsten:
    % Fehlermeldung
    if isempty(SentenceOut)
        errordlg('ERROR: Dieser Satz ist nicht bestandteil der Datenbank. Bitte ueberpruefen Sie noch einmal die Eingabe')
    else
        fprintf('\nDer Satz mit dem Kuerzel "%s" findet sich in folgenden Ordner/n wieder:\n\n', Sentence);
        fprintf('%s\n', SentenceOut{:});
        fprintf('\n\n');
    end
end

if ~isempty(Person) == 1
    [PersonOut,rec_list] = SearchRecordingOfPerson(Person); % Funktionsaufruf
    SentenceOut = []; WordOut = []; PhonemOut = [];
    % Überprüft ob eingebene Person vorhanden Ansonsten:
    % Fehlermeldung
    if isempty(PersonOut)
        errordlg('ERROR: Die gesuchte Person ist nicht bestandteil dieser Datenbank. Bitte ueberpruefen Sie noch einmal die Eingabe')
    else
        % Ausgabe des Ergebnis im Command Window
        fprintf('\n\nDie Aufnahmen der Person mit\ndem Kuerzel "%s" finden Sie im Datenordner "%s"\nDie entsprechenden Audioaufnahmen lauten:\n\n', Person, PersonOut);
        fprintf('%s\n', rec_list{:});
        fprintf('\n');
    end
end

if ~isempty(Phonem) == 1
    PhonemOut = SearchWord(Phonem); % Funktionsaufruf
    SentenceOut = []; PersonOut = []; WordOut = []; rec_list = [];
end


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