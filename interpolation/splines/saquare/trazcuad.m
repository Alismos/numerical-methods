function [A,S] = trazcuad(X,Y)

format short 

n = length(X);
m=3*(n-1);
A=zeros(m);
b=zeros(m,1);
S=zeros(n-1, 3);

 if n~=length(Y)
     return;
 end 
 %condicion de interpolacion 
 for i=1:n-1
     A(i+1,3*i-2:3*i)=[X(i+1)^2 X(i+1) 1];
     b(i+1)=Y(i+1);
     
 end
 
 A(1,1:3)=[X(1)^2 X(1)^1 1];
 b(1)=Y(1);
 
 %condiciones de continuidad
 for i=2:n-1
     
     A(n-1+i,3*i-5:3*i)=[X(i)^2 X(i) 1 -X(i)^2 -X(i) -1];
     b(n-1+i)=0;
 end
 
 %condicion de suavidad 
 
 for i=2:n-1
     A(2*n-3+i, 3*i-5:3*i)=[2*X(i) 1 0 -2*X(i) -1 0];
     b(2*n-3+i)=0;
 end
 
 %ultima condicion 
 A(m,1)=2;
 b(m)=0;
 
 %Se resuelve el sistema
 Saux=A\b;
 Saux
 A
 b
 
 end