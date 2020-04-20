function [ thre_sol, thre_asy ] = thre( ss,chi,epsilon,c )
%THRE_SOL Summary of this function goes here
%   Detailed explanation goes here
global f;
b=4.9343;
thre_sol=c; thre_asy=c;
for i=1:length(c)
    dchi=@(xx)fnval(fnder(spline(ss,chi),1),xx)+1/epsilon+c(i);
    thre_sol(i)=fsolve(dchi,sqrt(epsilon*b*(1-f))/f);
    thre_asy(i)=sqrt(epsilon*b*(1-f))/f*(1+epsilon*(0.4698-0.4893/(1-f)-c(i))/2);
end
end
