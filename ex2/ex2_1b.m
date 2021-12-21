L=100;
rho=0.5;
q=8;
h=1;
tauStep=0.1;
steps=10^3;
%u=zeros(L+1,steps);
u=zeros(L,steps);
%du_dv=zeros(L+1,steps);
du_dv=zeros(L,steps);
x0=[20 50 50];
u0=[5.56155 1.43845 1.582295];

%for n=1:size(u0,2)
    x_0=x0(1);
    u_0=u0(1);
    
    for x_i=1:L  
        u(x_i,1)=u_0/(1+exp(1)^(x_i-x_0));
    end

    for tau=1:steps
        for x_i=2:L-1
            if x_i==2
                du_2=u(x_i+1,tau)-u(x_i,tau);
            elseif x_i==L-1
                du_2=u(x_i,tau)-u(x_i-1,tau);
            else
                du_2=(u(x_i+h,tau)+u(x_i-h,tau)-2*u(x_i,tau))/h^2;
            end
            du_dtau=rho*u(x_i,tau)*((1-u(x_i,tau))/q)-u(x_i,tau)/...
                (1+u(x_i,tau))+du_2;
            du_dv(x_i,tau+1)=u(x_i,tau)-u(x_i-1,tau);
            u(x_i,tau+1)=u(x_i,tau)+tauStep*du_dtau;
        end
    end
    figure;
    plot(2:L-1,u(2:size(u,1)-1,20))
    hold on
    plot(2:L-1,u(2:size(u,1)-1,21))
    %plot(u(2:size(u,1),20),du_dv(2:size(du_dv,1),20))
    hold off
%end