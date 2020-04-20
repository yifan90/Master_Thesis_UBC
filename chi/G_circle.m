function [ g ] = G_circle( N,r )
P=zeros(2,N);
for i=1:N
    P(1,i)=r*cos(2*pi/N*(i-1));
    P(2,i)=r*sin(2*pi/N*(i-1));
end
g=zeros(1,N);
g(1)=Regular(P(:,1));
for i=2:N
    g(i)=Green(P(:,i),P(:,1));
end 
end

function [a]=Green(x,chi)
a=(-log(norm(x-chi,2))-log(norm(norm(chi,2)*x-1/norm(chi,2)*chi,2))+(norm(x,2)^2+norm(chi,2)^2)/2-3/4)/2/pi;
end

function [a]=Regular(chi)
a=(-log(norm(norm(chi,2)*chi-1/norm(chi,2)*chi,2))+norm(chi,2)^2-3/4)/2/pi;
end