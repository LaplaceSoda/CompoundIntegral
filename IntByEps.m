%% 定义对于精度的求积公式
function F = IntByEps(f,Int_i,a,b,eps)
% f - 被积函数
% Int_i - 每一步的积分公式
% a - 积分上限
% b - 积分下限
% h - 积分步长
% n - 区间个数
F = 0;
n = (b-a)/h;
i = 0;
while  i < n
    F = F + Int_i(f,a + i * h,h,a + (i+1)*h);
    i = i + 1;
end
end