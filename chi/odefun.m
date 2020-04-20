function [ ff ] = odefun( x,y )
%ODEFUN Summary of this function goes here
%   Detailed explanation goes here
global s; global R; global N; global f;
ff=[ y(2);
    y(1)-f*y(1)^2*y(3)-(N-1)/x*y(2);
    y(4);
    y(1)^2*y(3)-y(1)-(N-1)/x*y(4)];
end

