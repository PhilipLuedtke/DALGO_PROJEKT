
% suchbegriffe
word = {'eins','zwei','drei'};
person = {'hans','dieter','olli'};

% antworten der subfunctions
listen = {{'1';'2';'3'},{'1';'2';'3'},[]};

% erstellen des antwort-structs
for kk = 1:3
   name = word{kk};
   s.word.(name) = listen{kk};
end
for kk = 1:3
   name = person{kk};
   s.person.(name) = listen{kk};
end


%%%%    ab hier ausgabe-function, die s als input hat  %%%%%%%%%


% fieldnames = "ordner-namen"
field_names_key = fieldnames(s);
for idx_keyword = 1:length(field_names_key)
    
    keyword = field_names_key{idx_keyword};
    field_names_search = fieldnames(s.(keyword));
    
    for idx_search_term = 1:length(field_names_search)
        
        search_item = field_names_search{idx_search_term};
        if isempty(s.(keyword).(search_item))
            fprintf('No items were found for the %s %s\n\n',keyword,search_item')
        else
            fprintf('Following items were found for the %s %s:\n',keyword,search_item);
            disp(s.(keyword).(search_item));
        end
    end
end




