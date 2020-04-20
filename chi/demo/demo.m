% qubic spline
x=[0 1 2]; y=[3 4 5]; % data points
qs=spline(x,y);
spline(x,y,0.5)
fnval(qs,0.5)
%derivative
fnval(fnder(qs),0.5)

%ode bvp solver
x=.01:.01:15;
%initial guess
ini=bvpinit(x,@iniguess);
sol=bvp4c(@odefun,@bvp,ini);
plot(sol.x,sol.y(1,:))
