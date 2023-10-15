% adaln1p  implements ADALINE update learning from 1 pattern and targets
% The pattern is column vector p, the targets are in column vector t
% Calculates the error (for this pattern) in col. vector e
% It also receives learning rate alph.
% Receives old weigth matrix Wold and col. vector old biases bold
% Returns Wnew, bnew and mean of errors squared FOR THIS PATTERN ek2
% BASED ON MultiNeuron Case (mtx. Form) in Hagan slide 10-10
%
% SYNTAX [Wnew, bnew, msek] = adaline1p(Wold, bold, alph, p , t);
%
function [prediction] = adaline_test(W, b, pattern)
% Calculate net_inputs = activations (remember: linear, so n = a)
prediction = hardlims(W * pattern + b) ;
% Computer (column vector) of errors, e
end
