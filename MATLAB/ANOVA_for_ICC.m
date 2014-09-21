function [table] = ANOVA_for_ICC(X, displayopt)
% ---------------------------------------------------------------
% Analysis of Variance for Ratings (for Intraclass Correlations)
%
% [table] = ANOVA_for_ICC(X, displayopt)
%           returns the ANOVA summary table as a cell array
%
% The input X is an n x k matrix, where n is the number of tar-
% gets and k is he number of judges. The option of displaying
% an ANOVA summary table is handled by displayopt, which can be
% set to 'on' (default) or 'off.'
% ---------------------------------------------------------------
% Script:
   [m,n] = size(X);
   total = m*n;

   A  = sum(sum(X.^2));
   Bc = sum(sum(X,1).^2)/m;
   Br = sum(sum(X,2).^2)/n;  
   D  = sum(sum(X))^2/total;

   SSbc = Bc-D;
   SSwc = A-Bc;   
   SSbr = Br-D;
   SSwr = A-Br;
   SSe  = A-Br-Bc+D;

   DFbc = n-1;
   DFwc = n*(m-1);
   DFbr = m-1;   
   DFwr = m*(n-1);
   DFe  = DFbc*DFbr;

   MSbc = SSbc/DFbc;
   MSwc = SSwc/DFwc;
   MSbr = SSbr/DFbr;
   MSwr = SSwr/DFwr;
   MSe  = SSe/DFe;

   Fbc = MSbc/MSe; Pbc = 1-fcdf(Fbc, DFbc, DFe);
   Fbr = MSbr/MSe; Pbr = 1-fcdf(Fbr, DFbr, DFe);
       
   table = { 'Source of Variance' 'SS' 'df' 'MS' 'F' 'Prob>F'
             'Columns'             []   []   []   []  []
             '     betweeen'       SSbc DFbc MSbc Fbc Pbc
             '     within'         SSwc DFwc MSwc []  []
             'Rows'                []   []   []   []  []
             '     between'        SSbr DFbr MSbr Fbr Pbr 
             '     within'         SSwr DFwr MSwr []  []
             'Residual'            SSe  DFe  MSe  []  [] };

   if isequal(nargin, 1) || isequal(displayopt, 'on')
        statdisptable(table, 'ANOVA for ICC', ...
                             'ANOVA Summary Table', '');
   end
% ---------------------------------------------------------------