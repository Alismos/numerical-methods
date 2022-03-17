clear all
clc
format long
%%Se define la funcion
fun=@(x) x.^3-10*x-5;
%% Se define el metodo de la secante
%El metodo requiere dos puntos de inicio
x(1)=2;
x(2)=4;
%criterio de parada n=10
n=10;
%para ejectuar la siguiente ecuacion 10 veces se usa un for hasta 10
for i=1:n
    x(i+2)=x(i+1)-fun(x(i+1))*(x(i+1)-x(i))/(fun(x(i+1))-fun(x(i)));
end
raiz=x(end);%el ultimo valor que haya quedado
display('la primera raiz positiva es:')
display(raiz)
%% Analisis de la solucion
%para analizar se realiza la grafica y se plotea la raiz encontrads
xr=raiz;
yr=fun(raiz);
X=-4:0.01:4;
Y=fun(X);
plot(X,Y,'-r',xr,yr,'+b');

