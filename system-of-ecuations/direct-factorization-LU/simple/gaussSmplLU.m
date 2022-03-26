function [x,L,U]=gaussSmplLU(A,b)
format long;
text=fopen('textGaussSmplLU.txt','w');
[m,n]=size(A);

x=zeros(n,1);

if m~=n
     fprintf(text, 'Error \n Matrix ''A'' must be square');
     fclose(text);
     open('textGaussSmplLU.txt');
     return;
 end
 if m~=length(b)
     fprintf(text, 'Error \n Wrong vector');
     fclose(text);
     open('textGaussSmplLU.txt');
     return;
 end
 
  if det(A)==0
     fprintf(text, 'Error \n Determinant of the matrix must be zero');
     fclose(text);
     open('textGaussSmplLU.txt');
     return;
  end
 fclose(text);
 
 [L,U]=smplLu(A);
 
 text=fopen('textGaussSmplLU.txt','a');
 fprintf(text,'\n Despues de stspro y stsre');
 fprintf(text,'x:\n');
 fprintf(text, '%.6f\n',x);
 
 fclose(text);
 open('textGaussSmplLU.txt');
end