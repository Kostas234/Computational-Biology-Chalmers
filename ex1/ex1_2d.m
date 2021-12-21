t=100;
K=10^3;
b=1;
r=0.1;
N=zeros(1,t);
N_0=[1,2,3,10];
for j=1:size(N_0,2)
    N(1)=N_0(j);
    for i=2:t
        N(i)=((r+1)*N(i-1))/(1+(N(i-1)/K)^b);
    end
    hold on
    loglog(1:t,N(1,:))
end
hold off