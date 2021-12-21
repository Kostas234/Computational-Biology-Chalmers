b_n=[0.1 1 10];
d_n=[0.2 2 5];
dt=0.1;
time=dt;
time_b=[];
time_d=[];
N=20;
I=1;
S=N-I;
b=b_n(1);
d=d_n(1);
for i=1:100
    prob1=rand();
    if prob1<b
        time_b=[time_b time];
        time=0.01;
        %I=I+1;
        continue;
    end
    prob2=rand();
    if prob2<d
        time_d=[time_d time];
        time=0.01;
        %I=I-1;
        continue;
    end
    time=time+dt;
end