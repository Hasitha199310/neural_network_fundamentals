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
function [Wnew, bnew, msek] = adaline1p(Wold, bold, alph, p , t);
% Find size of W: rows = # input features , cols = # PEs
[wr, wc] = size(Wold);
% Calculate net_inputs = activations (remember: linear, so n = a)
activ = Wold * p + bold ;
% Computer (column vector) of errors, e
e = t - activ;
%  Computer Mean of Squared Errors FOR JUST THIS PATTERN
% Notice we "average" accross as many output PEs as present
% by dividing teh sum of squares ( (e') * e ) by (length(e))
% (This is only meaningful if there are more tha 1 PEs
msek = ( (e') * e ) / (length(e)) ;
% IMPLEMENT EQUATIONS FROM HAGAN SLIDE 10-10
Wnew = Wold + (2 * alph * (e * (p')));
bnew = bold + (2 * alph * e);

end
