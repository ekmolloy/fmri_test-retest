function [DC] = DC(A, B, tA, tB, absolute)
% ---------------------------------------------------------------
% Dice Coefficient (i.e., Similarity Index for Sets)
%
% [DC] = DC(A, B, tA, tB, absolute)
%         returns the Dice Coefficient of A and B    
%
% The inputs A and B are both n dimensional matrices; tA and tB
% are the thresholds for A and B, respectively. Absolute is a 
% logical, which determines how the threshold is applied (true/1 
% = absolute value greater than threshold, false/0 = value great-
% er than threshold).
% ---------------------------------------------------------------
% Script:
   if ~isequal(size(A), size(B))
        error('Matrix dimensions do not match.');
   end

   % Threshold Matrices
   if isequal(absolute, 1)
        fA = abs(A)>tA; fB = abs(B)>tB;   
   else
        fA = A>tA; fB = B>tB;
   end
   fAfB = fA.*fB;

   % Dice Coefficient
   DC = (2*sum(fAfB(:))) / (sum(fA(:)) + sum(fB(:)));
% ---------------------------------------------------------------