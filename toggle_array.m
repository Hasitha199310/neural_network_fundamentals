% returns the toggled array given a matrix of initial input matrix and a
% toggling array
% The initial matrix should contain the values to be toggled

% Receives the "initial_matrix" which has the initial array to be toggled,
% the "toggling array", which has the respective pixel of each vector in the
% initial matrix to toggle,and the "test array" which is the matrix to
% populate.
%
% SYNTAX: test_set_array = toggle_array(initial_matrix,toggling_array,test_set_array);
%
function test_set_array = toggle_array(initial_matrix,toggling_array,test_set_array)

for j=1:length(toggling_array)
     x = toggling_array(j,1);
     y = toggling_array(j,2);
     test_set_array(:,j) = toggle(initial_matrix(:,j),x,y);  
end
end