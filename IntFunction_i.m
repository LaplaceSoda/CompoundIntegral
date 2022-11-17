% 本函数在于定义不同类型的求积函数接口 以供调用
function Int_i = IntFunction_i
    Int_i.Ti = @TiXing;
    Int_i.Mid = @Middle;
    Int_i.Sim = @Simpson;
end

%% 梯形公式
function y = TiXing(f,a,h,b)
    y = h * ( f(a) + f(b) )/2;
end


%% 中点公式
function y = Middle(f,a,h,b)
    y = h * f( (a+b)/2 );
end

%% Simpson公式
function y = Simpson(f,a,h,b)
    y = h/6 * ( f(a) + 4 * f( (a+b)/2 ) + f(b) );
end

%% Romberg公式

