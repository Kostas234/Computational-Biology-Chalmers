t=100;
K=10^3;
b=1;
r=0.1;
N_0=100; %value of stable steady state
N=zeros(1,t);
deltaN=[-10,-3,-2,-1,1,2,3,10];
n=zeros(1,t);

for j=1:size(deltaN,2)
    N(1)=N_0+deltaN(j);
    n(1)=deltaN(j);
    for i=2:t        
        N(i)=N_0+(1-b*r/(r+1))*n(i-1);
        n(i)=(1-b*r/(r+1))*n(i-1);
    end
    hold on
    loglog(1:t,N(1,:),'--')
    axis([0 100 90 110])
end
hold off