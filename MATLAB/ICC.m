function [ICC] = ICC(X, model, rating)
% ---------------------------------------------------------------
% Intraclass Correlation Coefficient
%
% [ICC] = ICC(X, model, rating)
%         returns the Intraclass Correlation Coefficient of X
%
% The input X is an n x k matrix, where n is the number of tar-
% gets and k the number of judges. ICCs are divided into three 
% models for two types of ratings.
%
% Model Types:
% '1' = random effects model => a different group of k judges, 
%       who have been selected from a larger population of jud-
%       ges, rate each target
% '2' = mixed effects model => the same group of k judges, who 
%       have been selected from a larger population of judges, 
%       rate each target
% '3' = fixed effects model => the same group of k judges, who 
%       are the only judges of interest, rate each targets.
%
% Rating Types:
% '1' = individual rating
% 'k' = mean of several ratings
% ---------------------------------------------------------------
% Script: 
   [n,k] = size(X);
   table = ANOVA_for_ICC(X, 'off');

   BMS = table{6,4}; WMS = table{7,4};
   JMS = table{3,4}; EMS = table{8,4};
   
   if isequal(rating,'1')
        if isequal(model,'1')
             ICC = (BMS - WMS) / ...
                   (BMS + (k-1)*WMS);
        elseif isequal(model,'2')
             ICC = (BMS - EMS) / ...
                   (BMS + (k-1)*EMS + k*(JMS-EMS)/n);
        elseif isequal(model,'3')
             ICC = (BMS - EMS) / ...
                   (BMS + (k-1)*EMS);
        else
             error('Model type does not exist.');
        end     
   elseif isequal(rating,'k')
        if isequal(model,'1')
             ICC = (BMS - WMS) / …
                    BMS;
        elseif isequal(model,'2')
             ICC = (BMS - EMS) / ...
                   (BMS + (JMS-EMS)/n);
        elseif isequal(model,'3')
             ICC = (BMS - EMS) / …
                    BMS;
        else
             error('Model type does not exist.');
        end
   else
        error('Rating type does not exist.');
   end
% ---------------------------------------------------------------