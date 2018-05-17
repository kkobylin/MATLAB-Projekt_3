function c = Newtonroot(a)
%Funkcja znajdujaca pierwiastek funkcji fun
%metoda Newtona zaczynajac w punkcie a 

c=1;
iterations=0;

while(abs(fun(c))>1e-9 && iterations<=1000)
   c=a-(fun(a) /derivative(a));
   a=c;
   iterations=iterations+1;
   disp(iterations)
   disp(c)
   disp(fun(c))
end
if(iterations>999)
    disp("Zbyt wiele potrzebnych iteracji")
else
disp(iterations)
end

end

