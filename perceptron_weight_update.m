% returns the output of perceptrons given the net inputs and the
% bias
%
% SYNTAX: perceptron_neuron = perceptron_neuron(weights,biases);
%
function [weights,bias] = perceptron_weight_update(inputs,targets,initial_weights,initial_bias)
input_matrix_size = size(inputs);

wold= initial_weights;
bold= initial_bias;

for i=1:input_matrix_size(1)
    disp(['loop ', num2str(i), ' running']);
    pattern = inputs(i,:);
    output = perceptron_forward(pattern,wold,bold);
    disp('output is ')
    disp(output)

    error = output-targets(i);
    disp('target is ')
    disp(targets(i))
    disp('error is ')
    disp(error)

    wnew = wold + error.*pattern;
    bnew = bold + error;

    wold = wnew;
    bold = bnew;
    disp(['weights are']);
    disp(wold);
    disp(['bias is'])
    disp(bold);
end

weights= wold;
bias  = bold;
end


