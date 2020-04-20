clear;
global s; global R; global N; global f;
s=0.1; N=1; R=15; f=0.5;
x=.005:.005:R;
ss=.1:.04:.8;
chi=ss;
n=length(ss);
for ii=1:n
    ii
    N=1; s=ss(ii);
    tic
    ini=bvpinit(x,@iniguess);
    sol=bvp4c(@odefun,@bvp,ini);
    toc
    N=N+.05;
    x=sol.x; y=sol.y; yp=sol.yp;
    while N<=2
        tic
        N
        u=y(1,:); up=y(2,:); v=y(3,:); vp=y(4,:);
        xt=round(linspace(1,length(x),200));
        iniguess2=@(xx) [spline(x(xt),u(xt),xx);
            fnval(fnder(spline(x(xt),u(xt)),1),xx);
            %spline(x(xt),up(xt),xx);
            spline(x(xt),v(xt),xx);
            fnval(fnder(spline(x(xt),u(xt)),1),xx);
            %spline(x(xt),vp(xt),xx)
            ];
        ini=bvpinit(x,iniguess2);
        sol=bvp4c(@odefun,@bvp,ini);
        x=sol.x; y=sol.y; yp=sol.yp;
        save([num2str(s) '_' num2str(N) '.mat'],'x','u','up','v','vp','s');
        N=N+.05;
        toc
    end    
    chi(ii)=y(3,length(x))-s*log(R);  
    tchi=chi(ii);
    save(num2str(ii),'x','u','up','v','vp','tchi','s');
end