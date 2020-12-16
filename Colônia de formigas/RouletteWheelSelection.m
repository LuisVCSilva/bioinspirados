%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPEA104
% Project Title: Ant Colony Optimization for Continuous Domains (ACOR)
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function j=RouletteWheelSelection(P)

    r=rand;
    C=cumsum(P);
    j=find(r<=C,1,'first');

end