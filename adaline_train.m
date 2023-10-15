% adaline1e implements ADALINE UPDATE learning for a number of epochs
%
%
% SYNTAX: [Wepoch, bepoch, mseepoch] = adaline_train(Wold, bold, alph, P , T);
%
function [Wlast, blast, MSE, LastMSE] = adaline_train(W_initial, b_initial, alpha, patterns , targets,n_epochs);
% Find size of W: rows = # input features , cols = # PEs
[wr, wc] = size(W_initial);
% Find the size of P: columns = # patterns in Training Set
[pr, pc] = size(patterns);
% initialize accumulator for MSE OF THE WHOLE EPOCH to 0
MSE = zeros(1,n_epochs);

Wold = W_initial; 
bold = b_initial;
%  LOOP FOR AS MANY AS maxepoch
for ep = 1: n_epochs
  [Wepoch, bepoch, mseepoch] = adaline1e(Wold, bold, alpha, patterns, targets);
  MSE(ep) = mseepoch;
  Wold = Wepoch;  % "Re-circulate" trained weights to next epoch  
  bold = bepoch;  % "Re-circulate" trained biases to next epoch 
  MSE_updated = mseepoch;
end   % End of epoch loop
  Wlast = Wold;  % "Re-circulate" trained weights to next epoch  
  blast = bold;  % "Re-circulate" trained biases to next epoch 
  LastMSE = MSE_updated;

end