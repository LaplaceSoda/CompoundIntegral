%% ������ھ��ȵ������ʽ
function F = IntByEps(f,Int_i,a,b,eps)
% f - ��������
% Int_i - ÿһ���Ļ��ֹ�ʽ
% a - ��������
% b - ��������
% h - ���ֲ���
% n - �������
F = 0;
n = (b-a)/h;
i = 0;
while  i < n
    F = F + Int_i(f,a + i * h,h,a + (i+1)*h);
    i = i + 1;
end
end