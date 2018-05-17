function c = Bisectionroot(a,b)
%Funkcja znajduja zero funkcji fun
%w przedziale [a,b] metoda bisekcji

c=(a+b)/2;
iterations=0;
while(abs(fun(c))>1e-9 && abs((b-a))>1e-5)
    c=(a+b)/2;
   if(fun(a)*fun(c)<0)
       b=c;
   else a=c;
   end
   iterations=iterations+1;
   disp(iterations)
   disp(c)
   disp(fun(c))
end
      disp(c)  
      disp(iterations)
end

