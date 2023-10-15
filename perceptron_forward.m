% returns the output of perceptrons given the net inputs and the
% bias
%
% SYNTAX: perceptron_neuron = perceptron_neuron(weights,biases);
%
function perceptron_forward_out = perceptron_forward(inputs,weights,bias)
 net_input = sum(weights.* inputs)+bias';
 perceptron_forward_out = hardlims(net_input);
end