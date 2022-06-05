function Incremented_cell = Calculate_Distance( Current_Code, CodeBook )
%This fuction calculate the euclidean distance between the current
%extracted code and the codebook
x = size(CodeBook); 
length_of_code_book = x(1);
D = [];
for i=1 : length_of_code_book
    %D(i) = pdist2(Current_Code,CodeBook(i,:),'chisq');
    D(i) = sqrt(sum((Current_Code - CodeBook(i,:)) .^ 2));
end
[val, idx] = min(D(:));
Incremented_cell = idx;
