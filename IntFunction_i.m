% ���������ڶ��岻ͬ���͵ķǸ�����������ӿ� �Թ�����
function Int_i = IntFunction_i
    Int_i.Ti = @TiXing;
    Int_i.Mid = @Middle;
    Int_i.Sim = @Simpson;
    Int_i.Rom = @Romberg;
end

%% ���ι�ʽ
function y = TiXing(f,a,h,b)
    y = h .* ( f(a) + f(b) )/2;
end

%% �е㹫ʽ
function y = Middle(f,a,h,b)
    y = h .* f( (a+b)/2 );
end

%% Simpson��ʽ
function y = Simpson(f,a,h,b)
    y = h/6 .* ( f(a) + 4 .* f( (a+b)/2 ) + f(b) );
end

%% Romberg��ʽ

function y = Romberg(f,a,h,b)
    % Ti - ����ȷ�i�ݵ����ι�ʽ
    T1 = h .* ( f(a) + f(b) )./2;                                                 % ����0�Σ�����ȷ�Ϊ1
    T2 = 0.5.*T1 + h/2 .* f((a+b)./2);                                             % ����1�Σ�����ȷ�Ϊ2
    T4 = 0.5.*T2 + h/4 .* ( f(a+h./4) + f(b-h./4) );                                % ����2�Σ�����ȷ�Ϊ4
    T8 = 0.5.*T4 + h/8 .* ( f(a+h./8) + f(a+3.*h/8) + f(a+5.*h./8) + f(a+7.*h./8) );    % ����3�Σ�����ȷ�Ϊ8
    % Si - ����ȷ�i�ݵ�Simpson��ʽ
    S1 = 4/3 .* T2 - 1/3 .* T1;
    S2 = 4/3 .* T4 - 1/3 .* T2;
    S4 = 4/3 .* T8 - 1/3 .* T4;
    % Ci - ����ȷ�i�ݵ�Cotes��ʽ
    C1 = 16/15 .* S2 - 1/15 .* S1;
    C2 = 16/15 .* S4 - 1/15 .* S2;
    % Ri - ����ȷ�i�ݵ�Romberg��ʽ
    R1 = 64/63 .* C2 - 1/63 .* C1;
    y = R1;
end

%{  
%�����㷨�����һ�� ���Ҳ���� �����ǵ���IntByH����ʱ���������ۻ�
function y = Romberg(f,a,h,b)
    S1 = 4/3 .*  IntByH(f,@TiXing,a,h/2,b) - 1/3 .* IntByH(f,@Simpson,a,h,b);
    % Ci - ����ȷ�i�ε�Cotes��ʽ
    C1 = 16/15 * IntByH(f,@Simpson,a,h/2,b) - 1/15 * IntByH(f,@Simpson,a,h,b);
    C2 = 16/15 * IntByH(f,@Simpson,a,h/4,b) - 1/15 * IntByH(f,@Simpson,a,h/2,b);
    % Ri - ����ȷ�i�ε�Romberg��ʽ
    R1 = 64/63 * C2 - 1/63 * C1;
    y = R1;
end
%}



