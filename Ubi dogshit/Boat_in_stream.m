clear;clc;close

N=71; H=20; Vn=2; V1=5;
V(1)=0; x(1)=0; y(1)=0;
B=1; T=H/Vn;
dT=H/(Vn*N);
for i=2:N
    if i>N/2+1
        B=-1;
    end
    V(i)=V(i-1)+B*V1/(N/2);
    x(i)=x(i-1)+(V(i-1)+V(i))/2*dT;
    y(i)=Vn*i*dT;
end
plot (x,y)
