function [ f ] = odefun( x,y )
%ODEFUN Summary of this function goes here
%   Detailed explanation goes here
f=[ y(2);
    y(1)-y(1)^2];
end

