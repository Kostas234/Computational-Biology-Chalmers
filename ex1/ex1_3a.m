t=300;
a=0.01;
R=1:0.1:30;
eta=zeros(1,t);
eta(1)=900;
for j=1:size(R,2)
    for i=2:t
        eta(i)=R(j)*eta(i-1)*exp(-a*eta(i-1));
    end
    r=zeros(1,100)+R(j);
    hold on
    plot(r(1,:),eta(t-100+1:t),'.')
end
hold off
