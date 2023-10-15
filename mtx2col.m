% mtx2col - FOR EEL5813 PRJ 1, converts an input pattern
% from a 4-by-5 MATRIX PM
% to a 20-by-1  column vector p 
% to a 4-by-5 MATRIX PM
% SYNTAX:  p = mtx2col(PM);
%
function p = mtx2col(PM);
p = reshape(PM,20,1);
end