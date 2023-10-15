% dispapm  For EEL5813 PROJECT 1, 
% display an input pattern given as Matrix PM
% 
% SYNTAX: dispapm(PM);
% 
function dispapm(PM);
    mtx = flipud(PM);
    [r,c] = size(mtx);
    ckb = zeros(r+1,c+1);
    ckb(1:r,1:c) = mtx;
    pcolor(ckb);
    shading faceted;
    colormap('cool')
    colorbar
end
