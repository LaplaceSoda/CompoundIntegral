%% 定义对于精度的求积公式
function F = IntByH(f,Int_i,a,h,b)
% f - 被积函数
% Int_i - 每一步的积分公式
% a - 积分上限
% b - 积分下限
% h - 复化区间长度，由于不同方式求积还会二分，实际计算步长可能是h/2、h/4、h/8
% n - 区间个数
F = 0;
n = (b-a)/h;
i = 0;
while  i < n
    F = F + Int_i(f,a + i .* h,h,a + (i+1).*h);
    i = i + 1;
end
end