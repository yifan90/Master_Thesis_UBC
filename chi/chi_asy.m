function [ chia ] = chi_asy( s )
global f;
b=4.9343; U1=0.4893*b^2; U2=0.4698*b^2;
chia=s;
for i=1:length(s)
    chia(i)=b*(1-f)/f/f/s(i)-s(i)*((1-f)*U2-U1)/(1-f)/b/b;
end
end

