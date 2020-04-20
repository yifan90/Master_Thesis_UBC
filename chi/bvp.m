function [ res ] = bvp( ya,yb )
%BVP Summary of this function goes here
%   Detailed explanation goes here
global s; global R; global N; global f;
res=[ya(2);
    ya(4);
    yb(1);
    yb(4)-s/R];
end

