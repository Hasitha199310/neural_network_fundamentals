% test_set_gen : converts a array of (x,y) coordinates to a vector of test
% data by toggling each (x,y) in the initial vector
% 
% 
% SYNTAX:  TS = test_set_gen(init,matrix_dim,toggling_array);
%
function TS = test_set_gen(init,matrix_dim,toggling_array)
rows = matrix_dim(1);
init_size = size(init);
init_pixels = init_size(2);
toggling_array_size = size(toggling_array);

test_set = zeros(init_pixels,toggling_array_size(2));

for i=2:length(toggling_array)+1
    toggling_array_index = i-1;
    toggling_array_element = toggling_array(toggling_array_index,:);

    test_array_index = toggling_array_element(1)*rows+toggling_array_element(2);
    test_set(test_array_index) = 1;
end
TS =test_set;
end


