function [x, err] = rMult(f, x0, delta, maxn)

% Input
% - f es la función a evaluar
% - x0 es el punto inicial
% - delta es el valor de tolerancia
% - maxn número máximo de iteraciones a ejecutar

% Output
% - x es la aproximación de la solución
% - err es el error absoluto de la aproximación

fx = matlabFunction(diff(f, 1), 'Var', 'x');
fxx = matlabFunction(diff(f, 2), 'Var', 'x');
f = matlabFunction(f, 'Var', 'x');


if ~isa(f, 'function_handle')
    error("Error de tipos: f no es una función")
    
elseif ~isa(x0, 'numeric')
    error("Error de tipos: x0 no es un número")
    
elseif ~isa(delta, 'numeric') && delta > 0
    error("Error de tipos: delta no es un número positivo")
    
elseif ~isa(maxn, 'numeric') && maxn > 0
    error("Error de tipos: maxn no es un número entero positivo f")
else
    
    y = feval(f, x0);
    fxEv = feval(fx, x0);
    fxxEv = feval(fxx, x0);
    err = delta + 1;
    d = fxEv^2 - (y*fxxEv);
    cont = 0;
    tabl = [cont, x0, y, err];
    while y ~= 0 && err > delta && d ~= 0 && cont < maxn
        x = x0 - ((y*fxEv)/(fxEv^2-(y*fxxEv)))
        y = feval(f, x)
        fxEv = feval(fx, x)
        fxxEv = feval(fxx, x)
        %d = fxEv^2 - y*fxxEv;
        err = abs((x - x0));
        cont = cont + 1;
        tabl(cont,1)=cont;
        tabl(cont,2)= x0;
        tabl(cont,3)= y;
        tabl(cont,4)= fxEv;
        tabl(cont,5)= fxxEv;
        tabl(cont,6)= err;
        
        x0 = x;
    end
    
    if y == 0
        disp("");
        disp(x + " es raíz");
        disp(tabl);
    elseif (err <= delta)
        disp(x + " es aproxamación a la raíz con tolerancia " + delta)
        disp(tabl);
    else
        disp("fracaso en " + maxn + " iteraciones")
    end
end