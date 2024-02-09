u = @(t) 1.0*(t>=0); y1 = @(t) t.*(u(t)-u(t-1))+u(t-1);
t = [-1:.001: 4]; y2 = @(t) 2*y1(t)+y1(t-1)+2*y1(t-2);
plot(t,y2(t),'k-'); xlabel('t'); ylabel('y_2(t)'); grid on;
set(gca,'xtick',[0 1 2 3],'ytick',[0 2 3 5]); axis([-1 4 -.5 5.5]);