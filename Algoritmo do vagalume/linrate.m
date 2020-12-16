
function x = linrate(xmax, xmin, tmax, tmin, t)
% LINRATE   Linear interpolation of value X in instant T, defined by previously known points
%           (tmin, xmin), (tmax, xmax)
x = xmin + ((xmax-xmin)/(tmax-tmin))*(tmax-t);