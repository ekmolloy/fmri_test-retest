function [RMSD] = RMSD(A, B)
% ---------------------------------------------------------------
% Root-Mean-Square Deviation
%
% RMSD = RMSD(A, B) 
%        returns the RMSD of A and B
%
% The inputs A and B are both n dimensional matrices.
% ---------------------------------------------------------------
% Script:			
   if ~isequal(size(A), size(B))
        error('Matrices dimensions do not match.');
   end

   sqdifs = (A - B).^2;
   RMSD = sqrt(sum(sqdifs(:)) / prod(size(A)));
% ---------------------------------------------------------------
