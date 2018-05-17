function [roots] = MullerM1(x0, x1, x2)
%Funkcja znajdujaca pierwiastki wielomianu f(x)
%metoda Mullera MM1 z punktami poczatkowymi x0, x1, x2

iterations=0;
x3=1;
%pierwiastki wielomianu
roots=zeros(4,1);
n=4;
%wspolczynniki wielomianu od a0,a1...
wsp=[9,2,-4,-7,1,0];
f = @(x) x^4 -7*x^3 -4*x^2 + 2*x + 9;
%x0p,x1p,x2p - poczatkowe wartosci x0, x1, x2
x0p=x0; x1p=x1; x2p=x2;
%petla for wykonujaca sie tyle razy ile pierwiastkow do znalezienia
for(j=1:n)
%petla while szukajaca pojedynczego pierwiastka
while ( abs(f(x3)) > 1e-9 & iterations<1000 )
%Przyjmujemy za x2 aktualna aproksymacje rozwiazania    
    
%zmienne przyrostowe
z0=x0-x2;
z1=x1-x2;
%wspolczynnik c funkcji kwadratowej ax^2 +bx +c
c=f(x2);

%Rozwiazywanie ukladu rownan z szukanymi a i b funkcji kwadratowej
W=z0^2 * z1 - z1^2 *z0;
Wa= z1*(f(x0)-f(x2)) - z0*(f(x1)-f(x2));
Wb= z0^2 * (f(x1)- f(x2)) - z1^2 * (f(x0) - f(x2));

a=Wa/W;
b=Wb/W;
%numerycznie poprawne wzory na pierwiastki funkcji kwadratowej
zA=((-2)*c)/(b+sqrt(b^2-4*a*c));
zB=((-2)*c)/(b-sqrt(b^2-4*a*c));
%Kolejne przyblizenie rozwiazania to pierwiastek polozony 
%najblizej x2
if(abs(b+sqrt(b^2-4*a*c))>= abs(b-sqrt(b^2-4*a*c)))
   zmin=zA;
else 
    zmin=zB;
end

x3=x2+zmin;
%Odrzucamy sposrod x0,x1,x2 punkt polozony najdalej od wyznaczonego x3
odlx0=abs(x3-x0);
odlx1=abs(x3-x1);
odlx2=abs(x3-x2);

if(odlx0>odlx1 & odlx0>odlx2 )
    x0=x3;
elseif (odlx1>odlx0 & odlx1>odlx2 )
    x1=x3;
else
    x2=x3;
end
iterations=iterations+1;
   disp(iterations)
   disp(x3)
   disp(f(x3))
end
disp("Liczba potrzebnych iteracji")
disp(iterations)
iterations=0;
%Wstawiamy znaleziony pierwiastek do wektora roots
roots(j)=x3;

%Dzieki schematowi hornera dzielimy wielomian f przez (x-x3)
q=zeros(1,6);
for i=1:n
   q(1,i+1)=(q(i)-wsp(i))/x3;
end
%W q2 zapisujemy odwrocony wektor q
q2=zeros(1,6);
for i=1:6
    q2(i)=q(7-i);
end
%Nowy wielomian f
f = @(x) q2(1,1)*x^4 +q2(1,2)*x^3 +q2(1,3)*x^2 + q2(1,4)*x + q2(1,5);
%Wracamy do poczatkowych wartosci x0,x1,x2
x0=x0p;
x1=x1p;
x2=x2p;
x3=1;
%Zmniejszamy rozmiar wielomianu
n=n-1;
%Uaktualniamy wektor wspolczynnikow wielomianu
for i=1:5
    wsp(i)=q(i+1);
end

end

end

