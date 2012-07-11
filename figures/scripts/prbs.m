close all;
M=127
N=M*1

u=zeros(N, 1);

u(1)=0;
u(2)=1;
u(3)=1;

for j=8: N
    u(j)=rem(u(j-3)+u(j-7), 2);
end
stairs(u.*2-1)
axis([0 N -1.5 1.5])
xlabel(['Sinal PRBS com N=' int2str(N) ' M=127']);
ylabel('Amplitude de u(t)');
title('Sinal pseudo randomico binário para n=7. u(t)=rem(u(t-3)+u(t-7), 2)');
