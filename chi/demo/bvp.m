function [ res ] = bvp( ya,yb )
%BVP Summary of this function goes here
%   Detailed explanation goes here
global s;
global R;
res=[ya(1)-1.5;
    yb(2)];
end

