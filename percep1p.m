% percep1p learns for one pattern p and its target
% to modify the old matrix of weight Wold and bias 
% vector bold, to find th enew ones Wnew bnew
% 
% SYNTAX: [Wnew, bnew] = percep1p(Wold, bold, p, t);  
%
function [Wnew, bnew] = percep1p(Wold, bold, p, t);

a = hardlims(Wold * p + bold);
e = t - a;

Wnew = Wold + (e *  transpose(p));
bnew = bold + e;

end
