function [ y ] = iniguess( x )
global s; global R; global N; global f;
y=[s*f/(1-f)/3/R*3/2*cosh(x/2)^(-2);
    -s*(3*sinh(x/2))/(2*cosh(x/2)^3);
    (1-f)/f^2*3*R/s+s/2/R^2*x^2;
    s/R^2*x];
end

