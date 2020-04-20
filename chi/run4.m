clear;
global s; global R; global N; global f;
s=0.1; N=1; R=15; f=0.4;
x=.005:.005:R;
ss=.1:.04:8;
chi=ss;
n=length(ss);
s=ss(1);
    
ini=bvpinit(x,@iniguess);
sol=bvp4c(@odefun,@bvp,ini);
N=N+.05;
x=sol.x; y=sol.y; yp=sol.yp;
u=y(1,:); up=y(2,:); v=y(3,:); vp=y(4,:);    
    
while N<=2.01
    N
    xt=round(linspace(1,length(x),200));
    iniguess2=@(xx) [spline(x(xt),u(xt),xx);
            spline(x(xt),up(xt),xx);
            spline(x(xt),v(xt),xx);
            spline(x(xt),vp(xt),xx)];      
      %  tic
      %  ini=bvpinit(x,iniguess2);
      %  toc
    ini.solver='bvp4c';
    ini.x=sol.x;
    ini.y=sol.y;
    ini.yinit=iniguess2;
    sol=bvp4c(@odefun,@bvp,ini);
    x=sol.x; y=sol.y; yp=sol.yp;
    u=y(1,:); up=y(2,:); v=y(3,:); vp=y(4,:);        
    %save([num2str(s) '_' num2str(N) '.mat'],'x','u','up','v','vp','s');
    N=N+.05;
end   
N=2;
chi(1)=y(3,length(x))-s*log(R);  
tchi=chi(1);
%save(num2str(1),'x','u','up','v','vp','tchi','s');

for ii=2:n
    ii
    s=ss(ii);
    xt=round(linspace(1,length(x),200));
        iniguess2=@(xx) [spline(x(xt),u(xt),xx);
            spline(x(xt),up(xt),xx);
            spline(x(xt),v(xt),xx);
            spline(x(xt),vp(xt),xx)];
        %ini=bvpinit(x,iniguess2);
    ini.solver='bvp4c';
    ini.x=sol.x;
    ini.y=sol.y;
    ini.yinit=iniguess2;
        
    sol=bvp4c(@odefun,@bvp,ini);
    x=sol.x; y=sol.y; yp=sol.yp;
    u=y(1,:); up=y(2,:); v=y(3,:); vp=y(4,:);
    chi(ii)=y(3,length(x))-s*log(R);  
    tchi=chi(ii);
    %save(num2str(ii),'x','u','up','v','vp','tchi','s');
end