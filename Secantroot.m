function c = Secantroot(a,b)
%Funkcja znajdujaca pierwiastek funkcji fun
%metoda siecznych na przedziale [a,b]
c=1;
iterations=0;

while (abs(fun(c))>1e-9 & iterations<10000)
   c=(a*fun(b)-b*fun(a))/(fun(b)-fun(a));
   a=b;
   b=c;
   iterations=iterations+1;
   disp(iterations)
   disp(c)
   disp(fun(c))
end
if(iterations>9999)
    disp("Zbyt wiele potrzebnych iteracji")
else
disp(iterations)
end

end

