% 计算波涅耳积分主程序
close all; clear all; clc;
Int_i = IntFunction_i;      %实例化IntFunction接口
%% 不同计算F(5)=int(cos(pi()/2*t^2),t,0,5)
% 积分上限 x = 5
h = 0.0001;
eps = 0.001;
Ft = IntByH(@f,@Int_i.Ti,0,h,5);
Fm = IntByH(@f,@Int_i.Mid,0,h,5);
Fs = IntByH(@f,@Int_i.Sim,0,h,5);
[h Ft Fm Fs]


%% 计算变上限积分F(x)=int(cos(pi()/2*t^2),t,0,x)



%% 设置被积函数
function y = f(t)
y = cos(t*t*pi()/2);
end