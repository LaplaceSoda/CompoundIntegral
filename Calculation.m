% 计算波涅耳积分主程序
close all; clear all; clc;
Int_i = IntFunction_i;      %实例化IntFunction接口

%% 计算F(5)=int(cos(pi()/2*t^2),t,0,5)
h = 0.001;
eps = 0.00000001;

Ft = IntByH(@f,@Int_i.Ti,0,h,5);
Fm = IntByH(@f,@Int_i.Mid,0,h,5);
Fs = IntByH(@f,@Int_i.Sim,0,h,5);
Fr = IntByH(@f,@Int_i.Rom,0,h,5);
[h Ft Fm Fs Fr]
Ft1 = IntByEps(@f,@Int_i.Ti,0,5,eps);
Fm1 = IntByEps(@f,@Int_i.Mid,0,5,eps);
Fs1 = IntByEps(@f,@Int_i.Sim,0,5,eps);
Fr1 = IntByEps(@f,@Int_i.Rom,0,5,eps);
[eps Ft1 Fm1 Fs1 Fr1]

%% 绘制变上限积分F(x)=int(cos(pi()/2*t^2),t,0,x)
% 采用定精度的求积公式
x = 0.1:0.1:100;
plot(x,IntByEps(@f,@Int_i.Rom,0,x,eps))

%% 设置被积函数
function y= f(t)
y = cos(t.*t.*pi()./2);
%y = sin(t.*t.*pi()./2);
end