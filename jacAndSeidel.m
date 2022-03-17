%Entradas
%1 es Jacobi, 2 Seidel







function x=jacAndSeidel(A, b, x0, tol, Nmax,l,w)

format long
text=fopen('textJacAndSeidel.txt','w');
[m,n]=size(A);

x=zeros(n,1);

if m~=n
     fprintf(text, 'Error \n Matrix ''A'' must be square');
     fclose(text);
     open('textJacAndSeidel.txt');
     return;
end
 
 if m~=length(b)
     fprintf(text, 'Error \n Wrong vector');
     fclose(text);
     open('textJacAndSeidel.txt');
     return;
 end
 
 if tol<0
     fprintf(text, 'Error \n Tolerance must be positive');
     fclose(text);
     open('textJacAndSeidel.txt');
     return;
 else
     
if Nmax<0
     fprintf(text, 'Error \n Error');
     fclose(text);
     open('textJacAndSeidel.txt');
     return;
 else
     Nmax=ceil(Nmax);
 end
 
 aux=sum(diag(A)==0);
 if aux>0
     fprintf(text,'Error \nError');
     fclose(text);
     open('textJacAndSeidel.txt');
     return;
 end
 
 if det(A)==0
     fprintf(text,'Error \nError');
     fclose(text);
     open('textJacAndSeidel.txt');
     return;
 end
 
 if isempty(x0)
     x0=zeros(n,1);
 end
 
 %Start
 D=diag(diag(A));
 L = -tril(A)+D;
 U = -triu(A)+D;
 if l==1%Jacobi
     inv(D);
     T=inv(D)*(L+U);
     C=inv(D)*b;
 elseif l==2 %Seidel
     T=inv(D-L)*U;
     C=inv(D-L)*b;
 elseif l==3 %metodo nuevo
     T=inv((214*eye(n))-U)*L
     C=inv((214*eye(n))-U)*b
 else %SOR
     T=inv(D-w*L)*((1-w)*D+w*U);
     C=w*inv(D-w*L)*b;
 end

resp=max(abs(eig(T)));

resp
 
 fprintf(text, 'Results:\n\n');
 fprintf(text, '\nT:\n');
 fprintf(text,[repmat('%.6f ', 1,n) '\n'], T');
 fprintf(text,'\nC:\n');
 fprintf(text,[repmat('%.6f ', 1,n) '\n'], C');
 fprintf(text,'\nradio espectral:\n');
 fprintf(text,'%.6f\n', resp);
 fprintf(text,'\n');
 
 fprintf(text,'| iter|      E       |\n');
 fprintf(text,'|  0  |              |');
 fprintf(text,[repmat('%.6f ', 1,n) '\n'], x0);
 
 xant=x0;
 err=1;
 cont=0;
 while err>tol && cont<Nmax
     xact=T*xant+C;
     err=norm(xant-xact,4);
     xant=xact;
     cont = cont+ 1;
     fprintf(text,'|%3.0u  |   %1.1e    |',cont,err);
     fprintf(text,[repmat('%.6f ', 1,n) '\n'], xact);
 end
 x=xact;
 
 fclose(text);
 open('textJacAndSeidel.txt');
     
 end
 
 
 
 
