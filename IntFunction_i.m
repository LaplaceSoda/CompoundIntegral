% 本函数在于定义不同类型的非复化求积函数接口 以供调用
function Int_i = IntFunction_i
    Int_i.Ti = @TiXing;
    Int_i.Mid = @Middle;
    Int_i.Sim = @Simpson;
    Int_i.Rom = @Romberg;
end

%% 梯形公式
function y = TiXing(f,a,h,b)
    y = h .* ( f(a) + f(b) )/2;
end

%% 中点公式
function y = Middle(f,a,h,b)
    y = h .* f( (a+b)/2 );
end

%% Simpson公式
function y = Simpson(f,a,h,b)
    y = h/6 .* ( f(a) + 4 .* f( (a+b)/2 ) + f(b) );
end

%% Romberg公式

function y = Romberg(f,a,h,b)
    % Ti - 区间等分i份的梯形公式
    T1 = h .* ( f(a) + f(b) )./2;                                                 % 二分0次，区间等分为1
    T2 = 0.5.*T1 + h/2 .* f((a+b)./2);                                             % 二分1次，区间等分为2
    T4 = 0.5.*T2 + h/4 .* ( f(a+h./4) + f(b-h./4) );                                % 二分2次，区间等分为4
    T8 = 0.5.*T4 + h/8 .* ( f(a+h./8) + f(a+3.*h/8) + f(a+5.*h./8) + f(a+7.*h./8) );    % 二分3次，区间等分为8
    % Si - 区间等分i份的Simpson公式
    S1 = 4/3 .* T2 - 1/3 .* T1;
    S2 = 4/3 .* T4 - 1/3 .* T2;
    S4 = 4/3 .* T8 - 1/3 .* T4;
    % Ci - 区间等分i份的Cotes公式
    C1 = 16/15 .* S2 - 1/15 .* S1;
    C2 = 16/15 .* S4 - 1/15 .* S2;
    % Ri - 区间等分i份的Romberg公式
    R1 = 64/63 .* C2 - 1/63 .* C1;
    y = R1;
end

%{  
%以下算法误差大的一批 算的也贼慢 怀疑是调用IntByH函数时误差进行了累积
function y = Romberg(f,a,h,b)
    S1 = 4/3 .*  IntByH(f,@TiXing,a,h/2,b) - 1/3 .* IntByH(f,@Simpson,a,h,b);
    % Ci - 区间等分i次的Cotes公式
    C1 = 16/15 * IntByH(f,@Simpson,a,h/2,b) - 1/15 * IntByH(f,@Simpson,a,h,b);
    C2 = 16/15 * IntByH(f,@Simpson,a,h/4,b) - 1/15 * IntByH(f,@Simpson,a,h/2,b);
    % Ri - 区间等分i次的Romberg公式
    R1 = 64/63 * C2 - 1/63 * C1;
    y = R1;
end
%}



