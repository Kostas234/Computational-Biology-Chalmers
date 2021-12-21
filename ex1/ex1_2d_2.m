t=100;
K=10^3;
b=1;
r=0.1;
N_0=[1,2,3,10];
N_diff=zeros(1,t);
n=zeros(1,t);
n(1)=1;

for j=1:size(N_0,2)
    N_diff(1)=N_0(j);
    n(1)=N_0(j);
    for i=2:t        
        N_diff(i)=(r+1)*n(i-1);
        n(i)=(r+1)*n(i-1);
    end
    hold on
    loglog(1:t,N_diff(1,:),'--')
    axis([0 100 0 100])
end
hold off