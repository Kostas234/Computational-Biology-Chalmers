L=128;
timeStep=0.01;
iterations=1000;
Dv=[2.3 2.7 3 5 9];
k=2;
%for k=2
%     u=3+(2*rand(L)-1)*0.1;
%     v=8/3+(2*rand(L)-1)*0.1;
%     u_=zeros(L);
%     v_=zeros(L);
    u=3+(2*rand(L+1)-1)*0.1;
    v=8/3+(2*rand(L+1)-1)*0.1;
    u_=zeros(L);
    v_=zeros(L);
    for it=1:1000
        for i=2:L-1
            for j=2:L-1
                if i==2
                    u_(L,j)=u_(i,j);
                    v_(L,j)=v_(i,j);
                elseif i==L-1
                    u_(1,j)=u_(i,j);
                    v_(1,j)=v_(i,j);
                elseif j==2
                    u_(i,L)=u_(i,j);
                    v_(i,L)=v_(i,j);
                elseif j==L-1
                    u_(i,1)=u_(i,j);
                    v_(i,1)=v_(i,j);
                end
                    Lu=u(i,j+1)+u(i,j-1)+u(i+1,j)+u(i-1,j)-4*u(i,j);
                    du_dt=3-9*u(i,j)+u(i,j)^2*v(i,j)+Lu;
                    u_(i,j)=u(i,j)+du_dt*timeStep;

                    Lv=v(i,j+1)+v(i,j-1)+v(i+1,j)+v(i-1,j)-4*v(i,j);
                    dv_dt=8*u(i,j)-u(i,j)^2*v(i,j)+Dv(1,k)*Lv;
                    v_(i,j)=v(i,j)+dv_dt*timeStep;
            end
        end
    end
        %heatmap(u_,'xlabel',' ','ylabel',' ')
%end

heatmap(u_(1:L,1:L),'Colormap', parula(5),'xlabel',' ','ylabel',' ')



