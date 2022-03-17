function [A,S] = trazlin(X,Y)
 format short
 
 n = length(X);
 m=2*(n-1);
 A=zeros(m); 
 b=zeros(m,1);
 S=zeros(n-1,2);
 
 if n~=length(Y)
     return;
 end
 
 %condiciones de interpolacion
 
 for i=1:length(X)-1
     A(i+1,[2*i-1 2*i])=[X(i+1) 1];
     b(i+1)=Y(i+1);
 end
 A(1,[1 2])=[X(1) 1];
 b(1)=Y(1);
 A
 %condiciones de continuidad 
 for i=2:length(X)-1
     A(length(X)-1+i,2*i-3:2*i)=[X(i) 1 -X(i) -1];
     b(length(X)-1+i)=0;
 end
 %se resuelve el sistema 
 Saux=gaussPivPar(A, b);
 temp = A\b;
 
 %se organiza la matriz de Salida
 for i=1:length(X)-1
     S(i,:)=Saux([2*i-1 2*i]);
 end
 %n=2;
 %for j=i:size()
end