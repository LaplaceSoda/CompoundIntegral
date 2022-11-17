% ���������ڶ��岻ͬ���͵���������ӿ� �Թ�����
function Int_i = IntFunction_i
    Int_i.Ti = @TiXing;
    Int_i.Mid = @Middle;
    Int_i.Sim = @Simpson;
end

%% ���ι�ʽ
function y = TiXing(f,a,h,b)
    y = h * ( f(a) + f(b) )/2;
end


%% �е㹫ʽ
function y = Middle(f,a,h,b)
    y = h * f( (a+b)/2 );
end

%% Simpson��ʽ
function y = Simpson(f,a,h,b)
    y = h/6 * ( f(a) + 4 * f( (a+b)/2 ) + f(b) );
end

%% Romberg��ʽ

