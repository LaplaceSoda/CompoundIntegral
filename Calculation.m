% ���㲨��������������
close all; clear all; clc;
Int_i = IntFunction_i;      %ʵ����IntFunction�ӿ�
%% ��ͬ����F(5)=int(cos(pi()/2*t^2),t,0,5)
% �������� x = 5
h = 0.0001;
eps = 0.001;
Ft = IntByH(@f,@Int_i.Ti,0,h,5);
Fm = IntByH(@f,@Int_i.Mid,0,h,5);
Fs = IntByH(@f,@Int_i.Sim,0,h,5);
[h Ft Fm Fs]


%% ��������޻���F(x)=int(cos(pi()/2*t^2),t,0,x)



%% ���ñ�������
function y = f(t)
y = cos(t*t*pi()/2);
end