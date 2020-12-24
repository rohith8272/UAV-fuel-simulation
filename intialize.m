clear 
close all
clc

%% aero data
Sref=0.6 ;% m2

aero_UAV=xlsread('UAVdata.xlsx','A:C');
CL_uav=aero_UAV(:,1);
CD_uav=aero_UAV(:,2);

% polynomial for drag polar
DP=polyfit(CL_uav,CD_uav,2);
CD_fit=DP(1)*CL_uav.^2+DP(2)*CL_uav+DP(3);

%% propeller data
Dprop= 0.482 ;%m
J=xlsread('UAVdata.xlsx','P3:P16');

%% CP vs J coeff
p0=0.03840634;
p1=0.04503419;  %x
p2=-0.06173971; %x2
p3=-0.06297906; %x3

%% engine data 
load engine_data.mat

[C,h]=contourf(xx,yy,Zeng,'LevelList',300:20:600);
clabel(C,h)
hold on
[C1,h1] =contour(xx,yy,Zeng,'LevelList',600:100:3000);
clabel(C1,h1);
xlabel('RPM')
ylabel('Engine torque')




