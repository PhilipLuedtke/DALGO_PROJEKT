# Function SearchDatabase.m
This function search for **words, persons, phonemes, recordings and sentences** in the TIMIT MIT Database. It is possible to combine the search.

Authors:
- Jan Heimann
- Philip Lüdtke
- Daniel Popken

It's part of the course `Daten & Algorithmen` (SS15) of the Jade University Wilhelmshaven/Oldenburg/Elsfleth.

To use this function you need [Matlab](http://de.mathworks.com/) and the TIMIT MIT Database with all subfunctions ([Link](https://github.com/PhilipLuedtke/DALGO_PROJEKT/commits/master)).
The following subfunctions are needed:
- SearchPhoneme.m
- SearchRecording.m
- SearchSentence.m
- SearchWord.m
- SearchPerson.m
- (SearchRecordingOfPerson.m)


The latest version of this function and its subfunctions can be found on [Github](https://github.com/PhilipLuedtke/DALGO_PROJEKT/commits/master).
Additionally, there are test-files for each subfunction (SearchWordTest.m,...).
All the subfunctions and the IMIT MIT Database must be placed in the same directory as the SearchDatabase.m-File.

`It is helpfull to check the adjusted path in the subfunctions to avoid potential errors.`
## How to use SearchDatabase.m
### Syntax:
`(s) = SearchDatabase('keyword1','type1','keyword2','type2',...)`

###input types:
- word
- sentence
- person
- phoneme
- recording

###output arguments:
- s: s is a struct with the input types and the directories/sentences/recordings which contains the search-word


Examples:
- `(s) = SearchDatabase('she','word','sa1','sentence','epi','phonem');`
- `(s) = SearchDatabase('she','word','her','word','marc0','person','sa1','sentence');`


##Version History:
- Ver. 0.01: initial create (empty) 14-April-2015 Initials (JH,DP,PL)
- Ver. 1.00: last update 04-May-2015 Initials (JH,DP,PL)

--------------------------------
Copyright (c) <2015>

J. Heimann, D. Popken, P. Lüdtke

Institute for Hearing Technology and Audiology
Jade University of Applied Siences
