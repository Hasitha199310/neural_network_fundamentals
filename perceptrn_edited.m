% perceptrn.m  - Implements the PERCEPTRON learning algorithm
% through as many as MAXEPOCH epochs, unless an epoch is reached
% in whichnthere were 0 non-zero errors (i.e., nze was 0 at 
% the end of the epoch, in which case it stops at the completion
% of that epoch. It recieves initial weights and biases W0 & b0
% as well as matrices P and T.
% It returns the final weights and biases, Wlast & blast, as
% well as the number of non-zero errors in last epoch executed
%
% SYNTAX: [Wlast, blast, nzelast] = perceptrn(W0,b0,P,T,MAXEPOCH);
%
function [Wlast, blast, nzelast,weight_matrix,bias_matrix,error_matrix] = perceptrn_edited(W0,b0,P,T,MAXEPOCH);
% set up a "while" to loop through complete epochs
% as a default it would complete MAXEPOCH epochs
W04e = W0;
b04e = b0;

[rw,cw] = size(W0);
[rb,cb] = size(b0);

weight_matrix = repmat(zeros(rw,cw),MAXEPOCH,1);
bias_matrix = repmat(zeros(rb,cb),MAXEPOCH,1);
error_matrix = zeros(MAXEPOCH,1);


for epc= 1:MAXEPOCH
    %Execute one epoch of perceptron leraning:
    epc = epc     % To start by displaying epoch number
    [Wepoch,bepoch,nze] = percep1e(W04e , b04e , P , T);
    weight_matrix(epc,:) = Wepoch;
    bias_matrix(epc) = bepoch;
    error_matrix(epc) = nze;



    % If the epoch HAD ZERO PATTERNS WITH ERROR EXIT NOW
    if (nze == 0)
            disp('Stopping as no errors are encountered')
            break;
    end
    % Otherwise, re-circulate the values and continue looping
    W04e = Wepoch;
    b04e = bepoch;
end
 % If thi spoint is reached (no premature break)
 % Report the final results in the return variables
 Wlast = Wepoch
 blast = bepoch
 nzelast  = nze
end
