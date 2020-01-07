%Question1
f=fopen('C:\TP4\analyse_alors.bin','r')
result=fread(f,'double')

%Question2
N=length(result)
M=N/24

%Question3
VNV=result(1:24:N)
pitch=result(2:24:N)
sigma=result(3:24:N)

a1=result(4:24)
a2=result(28:48)
a3=result(52:72)
a4=result(76:96)
a5=result(100:120)
a6=result(124:144)
a7=result(148:168)
a8=result(172:192)
a9=result(196:216)
a10=result(220:240)
a11=result(244:264)
a12=result(268:288)

a=[a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12]


VNV1=VNV(1)
pitch1=pitch(1)
sigma1=sigma(1)
%a1=a(1)

L=640
Fe=16000
t=(1:L)/Fe

if (VNV==1)
    e1=sawtooth(2*pi*pitch1*t)
else (VNV==0)
    randn(1,L)
end

e=e1*sigma1
b=1
est_x1=filter(b,a1,e)
figure(1);
plot(est_x1)

%partie3:
est_x=[]

for i=1:M
    VNV(i);
    pitch(i);
    sigma(i);
    if (VNV(i)==1)
    e1=sawtooth(2*pi*pitch(i)*t)
    else (VNV(i)==0)
    randn(1,L)
    end
    e=e1*sigma(i)
    b=1
    est_x1=filter(b,a(:,i),e)
    est_x=[est_x,est_x1]
    figure(2);
    plot(est_x)
end
soundsc(est_x,Fe)

