% returns the output of perceptrons given the net inputs and the
% bias
%
% SYNTAX: perceptron_neuron = perceptron_neuron(weights,biases);
%
function predictions = perceptron_predictions(input_matrix,weights,bias)
[cp,rp] = size(input_matrix);
predictions = zeros(1,rp);

for i=1:rp
    p = input_matrix(:,i);
    a = hardlims(weights * p + bias);
    predictions(i) = a;
end
 
end