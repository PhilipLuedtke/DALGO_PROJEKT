function [] = SearchDatabase2(varargin)
% function to search for a word, sentence, person or phonem, or a combination of them
% in the TIMIT MIT Database
% Usage x = SearchDatabase2('she','word','sa1','sentence','fvmh0','person','epi','phonem')
% Input Parameter:
%	 word: 		 Word you are looking for
%    sentence:   Sentence you are looking for
%    person:     Person you are looking for
%    phonem:     Phonem you are looking for
%------------------------------------------------------------------------

% Author: J. Heimann, D. Popken, P. Luedtke (c) TGM @ Jade Hochschule applied licence see EOF
% Source: If the function is based on a scientific paper or a web site,
%         provide the citation detail here (with equation no. if applicable)
% Version History:
% Ver. 0.01 initial create (empty) 14-Apr-2015  Initials (JH, DP, PL)
% Ver. 1.0  first implementation       27-Apr-2015    Initials (JH, DP, PL)
%------------Your function implementation here---------------------------

% --------------------Eingabegröße wird untersucht-------------------------
nr = nargin;
% --------------------findet raus wonach in der Eingabe gesucht wird-------
% ---------------------und greift auf den vorherigen Wert zu---------------
% ---------------------möglich ist die Suche nach mehreren Wörtern etc.----
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
% wird nicht nach z.B. Wörtern gesucht wird der Übergabeparameter an die Unter-
% funktion auf leere Menge gesetzt
if exist('Word2','var')==0;
    Word2 = {};
end
% Außerdem wird das Cell-Array, dass alle Wörter enthält von leeren Einträgen
% befreit
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

% Die Unterfunktion 'SearchWord' wird nun für alle Einträge des Cell-Arrays
% 'Word' aufgerufen und in einem Struct gespeichert
for ww = 1:length(Word)
    if  ~isempty(Word) == 1
        akt_word = Word{ww};
        s.word.(akt_word) = SearchWord(Word{ww});
    end
end

% gleiches passiert auch für....

% Sätze...
for ss = 1:length(Sentence)
    if ~isempty(Sentence) == 1
        akt_sentence = Sentence{ss};
        s.sentence.(akt_sentence) = SearchSentence(Sentence{ss});
    end
end

% Personen...
for pp = 1:length(Person)
    if ~isempty(Person) == 1
        akt_person = Person{pp};
        s.person.(akt_person) = SearchRecordingOfPerson(Person{pp});
    end
end

% und Phoneme
for phph = 1:length(Phonem)
    if ~isempty(Phonem) == 1
        akt_phonem = Phonem{phph};
        s.phonem.(akt_phonem) = SearchPhoneme(Phonem{phph});
    end
end

% Struct 's' wird an die Funktion 'output_data' übergeben für die Ausgabe im 
% Command Window
output_data(s);

% Außerdem wird das Struct 's' unter dem Namen 'data_list' im Workspace gespeichert 
assignin('base','data_list',s);

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