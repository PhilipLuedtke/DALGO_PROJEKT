function [ answer ] = SearchDatabase2( speaker_in,sentence_in,word_in,phon_in )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

speaker_out = SearchRecordingOfPerson(speaker_in);
sentence_out_roh = SearchSentence(sentence_in);
word_out = SearchWord(word_in);
phon_out_roh = SearchPhoneme(phon_in);

phon_out = 0;
sentence_out = 0;

[a,b] = size (phon_out_roh);
for kk = a+1:2*a
    phon_out = [phon_out; phon_out_roh{kk}(:)];
end

[c,d] = size (sentence_out_roh);
for nn = 1:c
    sentence_out = [sentence_out; sentence_out_roh(nn)];
end
%

size_vek = [length(speaker_out) length(sentence_out(2:end)) length(word_out) length(phon_out(2:end))];
new_len = max(size_vek);

speaker_out = [speaker_out zeros(1,new_len-length(speaker_out))];
sentence_out = [sentence_out zeros(1,new_len-length(sentence_out))]';
word_out = [word_out; zeros(1,new_len-length(word_out))];
phon_out = [phon_out; zeros(1,new_len-length(phon_out))];

answer = struct('Sprecher',speaker_out ,'Satz',sentence_out ,'Wort',word_out ,'Phonem',phon_out );
% answer = 0;
end

