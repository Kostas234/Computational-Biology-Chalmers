t=40;
a=0.01;
R=[5,10,23,13];
eta=zeros(1,t);
eta(1)=900;
for j=1:size(R,2)
    for i=2:t
        eta(i)=R(j)*eta(i-1)*exp(-a*eta(i-1));
    end
    r=zeros(1,40)+R(j);
    %figure;
    hold on
    plot(1:t,eta(t-40+1:t))
    legend('stable','2-point cycle','3-point cycle','4-point cycle')
    axis([0 40 0 1200])
    ylabel('η_τ')
    xlabel('τ')
end
hold off

% stable->2-point cycle: R=7.4
% ->4-point cycle: R=12.5