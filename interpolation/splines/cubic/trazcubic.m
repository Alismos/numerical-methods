function [A,S] = trazcubic(X,Y)
format short 

n = length(X);
m=4*(n-1);
A=zeros(m);
b=zeros(m,1);
S=zeros(n-1, 4);

if n~=length(Y)
     return;
end
 
 x1=diff(X);

 if sum(x1<0)>0
     return;
 end
 
 if sum(x1==0)>0
    return;
 end
 
 %condicion de interpolacion
 for i=1:n-1
     A(i+1,4*i-3:4*i)=[X(i+1)^3 X(i+1)^2 X(i+1) 1];
     b(i+1)=Y(i+1);   
 end
 A(1,1:4)=[X(1)^3 X(1)^2 X(1) 1];
 b(1)=Y(1);
 

 %condicion de continuidad
 for i=2:n-1
     A(n-1+i,4*i-7:4*i)=[X(i)^3 X(i)^2 X(i) 1 -X(i)^3 -X(i)^2 -X(i) -1];
     b(n-1+i)=0;
 end
 
 %condiciones de suavidad 
        
 for i=2:n-1
     A(2*n-3+i, 4*i-7:4*i)=[3*X(i)^2 2*X(i) 1 0 -3*X(i)^2 -2*X(i) -1 0];
     b(2*n-3+i)=0;
 end
 
 %condiciones de concavidad
 
 for i=2:n-1
     A(3*n-5+i, 4*i-7:4*i)=[6*X(i) 2 0 0 -6*X(i) -2 0 0 ];
     b(n+5+i)=0;
 end
 
  %condiciones de frontera
  A(m-1,1:2)=[6*X(1) 2];
  b(m-1)=1;
  A(m,m-3:m-2)=[6*X(end) 2];
  b(m)=1;
  
  %se resuelve el sistema 
  Saux=gaussPivTot(A,b);
end