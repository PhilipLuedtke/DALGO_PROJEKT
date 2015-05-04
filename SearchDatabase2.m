function [s] = SearchDatabase2(varargin)
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
% Ver. 1.0  first implementation       27-Apr-2015    Initials (JH, DP, PL)
%------------Your function implementation here---------------------------
nr = nargin;
for nn = 2:2:nr
    if strcmp('word',varargin{nn}) == 1;
        Word2{nn/2} = varargin{nn-1};
    elseif strcmp('sentence',varargin{nn}) == 1;
        Sentence2{nn/2} = varargin{nn-1};
    elseif strcmp('phonem',varargin{nn}) == 1;
        Phonem2{nn/2} = varargin{nn-1};
    elseif strcmp('person',varargin{nn}) == 1;
        Person2{nn/2} = varargin{nn-1};
    end
end

if exist('Word2','var')==0;
    Word2 = {};
end
Word = Word2(~cellfun('isempty',Word2));

if exist('Sentence2','var')==0;
    Sentence2 = {};
end
Sentence = Sentence2(~cellfun('isempty',Sentence2));

if exist('Person2','var')==0;
    Person2 = {};
end
Person = Person2(~cellfun('isempty',Person2));

if exist('Phonem2','var')==0;
    Phonem2 = {};
end
Phonem = Phonem2(~cellfun('isempty',Phonem2));

% Abfrage nach Übergabekriterien und Ausführen der Unterfunktionen:
for ww = 1:length(Word)
    % Überprüfung/Ausgabe des Wortes:
    if  ~isempty(Word) == 1
%         WordOut{ww} = SearchWord(Word{ww}); % Funktionsaufruf
        % Ausgabe:
        akt_word = Word{ww};
        s.word.(akt_word) = SearchWord(Word{ww});
    end
       
end
% disp(WordOut{:})
% Überprüfung/Ausgabe des Satzes:
for ss = 1:length(Sentence)
    if ~isempty(Sentence) == 1
%         SentenceOut{ss} = SearchSentence(Sentence{ss}); % Funktionsaufruf
        % Überprüft ob eingebener Satz vorhanden. Ansonsten:
        % Fehlermeldung
        akt_sentence = Sentence{ss};
        s.sentence.(akt_sentence) = SearchSentence(Sentence{ss});
        
    end
end

% Überprüfung/Ausgabe der Personen:
for pp = 1:length(Person)
    if ~isempty(Person) == 1
%         [PersonOut{pp},rec_list{pp}] = SearchRecordingOfPerson(Person{pp}); % Funktionsaufruf
        % Überprüft ob eingebene Person vorhanden Ansonsten:
        % Fehlermeldung
        akt_person = Person{pp};
        s.person.(akt_person) = SearchRecordingOfPerson(Person{pp});
    end
end

% Überprüfung/Ausgabe der Phoneme:
for phph = 1:length(Phonem)
    if ~isempty(Phonem) == 1
%         [PhonemOut{phph}] = SearchPhoneme(Phonem{phph});
        akt_phonem = Phonem{phph};
        s.person.(akt_phonem) = SearchPhoneme(Phonem{phph});
%         leer = cellfun('isempty',s.person.(akt_phonem){phph});
%         if leer(1,2) == 1
%             errordlg('ERROR: Dieses Phonem ist nicht Bestandteil der Datenbank. Bitte ueberpruefen Sie noch einmal die Eingabe')
%         else
%             
%             % Ausgabe des Ergebnisses im Command Window
%             %             fprintf('\n\nDas Phonem "%s" sagen folgende Personen:\n', Phonem);
%             %             fprintf('\nDas Phonem "%s" befindet sich in folgenden Saetzen:\n\n', Phonem);
%             
%         end
    end
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