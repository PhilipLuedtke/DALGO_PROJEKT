function [] = output_data(s)
% function to plot the result of the function SearchDatabase.m
% Usage [] = output_data(s)
% Input Parameter:
%	 s: 		 struct which contains the directories/sentences/recordings
%                 which contains the search-word(s)
%------------------------------------------------------------------------

% Author: J. Heimann D. Popken P. Luedtke (c) TGM @ Jade Hochschule applied licence see EOF
% Version History:

% Ver. 0.01 initial create (empty) 04-May-2015  Initials (JH, DP, PL)


%------------Your function implementation here---------------------------

field_names_key = fieldnames(s);
for idx_keyword = 1:length(field_names_key)
    % outer loop runs through the keywords
    keyword = field_names_key{idx_keyword};     % Defines keyword (f.e.: phonem)
    field_names_search = fieldnames(s.(keyword));   % Defines search items (f.e.: marc0)
    
    for idx_search_term = 1:length(field_names_search)
        % inner loop runs through the items which were found concerning the
        % keyword
        search_item = field_names_search{idx_search_term};
        if isempty(s.(keyword).(search_item))
            fprintf('No items were found for the %s %s\n\n',keyword,search_item')
        else
            fprintf('Following items were found for the %s %s:\n',keyword,search_item);
            disp(s.(keyword).(search_item));
        end
    end
end



%--------------------Licence ---------------------------------------------
% Copyright (c) <2015> J. Heimann D. Popken P. Luedtke
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