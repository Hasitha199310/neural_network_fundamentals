% adaline1e implements ADALINE UPDATE learning from a FULL EPOCH
% It calls adaln1p , which implements equations on Hagan Slide 10-10
% It receives the weight matrix and bias (col) vector before the epoch
% Wold, bold, as well as learning rate alph and thh MATRICES P and T
% containing training patterns and corresponding targets AS COLUMNS
% Returns Weights and biases after the whole epoch, Wepoch, bepoch
% and the MEAN squared error FOR THE WHOLE EPOCH mseepoch
%
% SYNTAX: [Wepoch, bepoch, mseepoch] = adaline1e(Wold, bold, alph, P , T);
%
function [Wepoch, bepoch, mseepoch] = adaline1e(Wold, bold, alph, P , T);
% Find size of W: rows = # input features , cols = # PEs
[wr, wc] = size(Wold);
% Find the size of P: columns = # patterns in Training Set
[pr, pc] = size(P);
% initialize accumulator for MSE OF THE WHOLE EPOCH to 0
mseacc = 0;
% FOR loop to process each column of P and each column of T
for q = 1:pc
    [Wnew, bnew, msek] = adaline1p(Wold, bold, alph, P(:,q) , T(:,q));
    Wold = Wnew;    % "Re-circulate" the newly found W for next pattern
    bold = bnew;    % "Re-circulate" the newly found b for next pattern
    mseacc = mseacc + msek;
end
mseepoch = mseacc / pc;
Wepoch = Wold;
bepoch = bold;

   
end
