syms y(t) x(t) C R
eqn = diff(y,t) + R/C * y == x/(C*R);
cond = y(0) == 1;
ySol(t) = dsolve(eqn, cond)

%%
C = 1.14e-6
Re = 46.15
Rs = 50
e = 2.71828182845904523536028747135266249

t = 0:0.000001:0.005;
h = (exp(-((Re/C)*t)))/(C*Rs);


figure
plot(t,h)
xlabel('Time');
ylabel('Impulse response - h(t)');
