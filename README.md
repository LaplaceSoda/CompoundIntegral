# 描述
1.复化求积分方法包括：复化梯形公式、复化中点公式、复化Simpson公式以及复化Romberg公式    
    
2.根据不同的数值积分方法求解波涅耳实例

# 实现
1.IntFunction_i.m定义了不同类型的求积函数接口，接口内定义了[Xi,Xi+1]上的积分公式g  
  
2.IntByH.m定义了在给定被积函数f,积分公式g,上限a,下限b,步长h的情况下的数值积分算法  
  
3.IntByEps.m定义了在给定被积函数f,积分公式g,上限a,下限b,精度Eps的情况下的数值积分    
     
4.Calculation.m定义了被积函数并根据IntByH(IntByEps)函数求解不同公式下的数值积分F  
