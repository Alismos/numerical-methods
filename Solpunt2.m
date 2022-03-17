clear all 
clc
format long
%%Punto 2
%%funcion del volumen del recipiente
L=10;
r=1;
Vol=12.4;
error=0.01;
%se evalua la funcion
V=@(h) L*(0.5*pi*r^2-r^2*asin(h/r)-h.*(r^2-h.^2).^(0.5))-Vol;
H=0.01:0.01:1;
%se grafica para tener idea de donde puede estar la raiz y hacer una
%eleccion adecuada de los valores iniciales para los metodos
plot(H,V(H));
title('GRAFICA DE LA FUNCION V(h)')
%PRIMER METODO METODO DE LA SECANTE
%El metodo de secante requiere dos puntos de inicio
x(1)=0.1;
x(2)=1;
%criterio de parada error relativo
%para ejectuar la siguiente ecuacion 10 veces se usa un for hasta 10
i=1;
er=1;%se asume un error grande
disp('el tiempo transcurrido para encontrar la raiz por metodo de la secante es:');
tic
while er>error
    x(i+2)=x(i+1)-V(x(i+1))*(x(i+1)-x(i))/(V(x(i+1))-V(x(i)));
    er=abs(x(i+2)-x(i+1))/abs(x(i+2));
    i=i+1;
end
toc
raiz=x(end);%el ultimo valor que haya quedado
disp('la raiz por el metodo de la secante es:')
display(raiz)
disp('la cantidad de iteraciones es:')
display(i-1)
%SEGUNDO METODO METODO DE NEWTON
syms h %se crea variable simbolica
%para el metodo de newton se debe encontrar la derivada de la funcion
%respecto a h
V1=diff(V(h));%se deriva respecto a h
%ahora se crea una funcion con esta ultima
Vd=@(z) subs(V1,z);
%metodo de newton
%se limpia variable
clear x
%inicializacion del metodo:
x(1)=0.2;%se escoge xi en base la grafica
i=1;
disp('El tiempo empleado por el metodo de newton para encontrar la raiz es:')
er=1;%se asume un error muy grande
tic
while er>=error
    x(i+1)=x(i)-V(x(i))/Vd(x(i));
    er=abs(x(i+1)-x(i))/abs(x(i+1));
    i=i+1;
end
toc
raiz=x(end);%el ultimo valor que haya quedado
disp('la raiz por el metodo de newton es:')
display(raiz)
disp('la cantidad de iteraciones es:')
display(i-1)