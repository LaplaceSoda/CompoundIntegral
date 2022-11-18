% ���㲨��������������
close all; clear all; clc;
Int_i = IntFunction_i;      %ʵ����IntFunction�ӿ�

%% ����F(5)=int(cos(pi()/2*t^2),t,0,5)
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

%% ���Ʊ����޻���F(x)=int(cos(pi()/2*t^2),t,0,x)
% ���ö����ȵ������ʽ
x = 0.1:0.1:100;
plot(x,IntByEps(@f,@Int_i.Rom,0,x,eps))

%% ���ñ�������
function y= f(t)
y = cos(t.*t.*pi()./2);
%y = sin(t.*t.*pi()./2);
end