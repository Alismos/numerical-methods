clear all
clc
%se define la funcion
fun=@(x) log(x.^2+1)-exp(x/2).*cos(pi*x);
%error de precision
error=0.01;%1 porciento
%se grafica la funcion para el intervalo dado:
a=-5;
b=6;
X=-5:0.01:6;%se define el intervalo
plot(X,fun(X));
title('Funcion f(x) problema 3')
%Se deriva la funcion para solucionar por el metodo de newton
syms z
g=diff(fun(z));
fd=@(x) subs(g,x); 
%Se implementa el metodo de newton
xv(1)=0.7;% se escoge porque de la grafica la pendiente que sale desde este punto corta muy cerca de la raiz que se pretende encontrar que es la
%primera raiz positiva
i=1;
er=1;%se define un valor muy grande para el error inicial
while er>=error
    xv(i+1)=xv(i)-fun(xv(i))/fd(xv(i));
    er=abs(xv(i+1)-xv(i))/abs(xv(i+1));
    i=i+1;
end
raiz=xv(end);%el ultimo valor que haya quedado
disp('la raiz por el metodo de newton es:')
display(raiz)
disp('la cantidad de iteraciones es:')
display(i-1)