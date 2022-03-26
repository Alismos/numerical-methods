vfunction [x,L,U]=gaussParLU(A,b)
format long;
text=fopen('textGaussParLU.txt','w');
[m,n]=size(A);

x=zeros(n,1);

if m~=n
     fprintf(text, 'Error \n Matrix ''A'' must be square');
     fclose(text);
     open('textGaussParLU.txt');
     return;
 end
 if m~=length(b)
     fprintf(text, 'Error \n Wrong vector');
     fclose(text);
     open('textGaussParLU.txt');
     return;
 end
 
  if det(A)==0
     fprintf(text, 'Error \n Determinant of the matrix must be zero');
     fclose(text);
     open('textGaussParLU.txt');
     return;
  end
 fclose(text);
 
 [L,U]=parLU(A);

 z=sustProAB(L,b)
 x=sustReAB(U,z)
 
 text=fopen('textGaussParLU.txt','a');
 fprintf(text,'\n Despues de stspro y stsre');
 fprintf(text,'x:\n');
 fprintf(text, '%.6f\n',x);
 
 fclose(text);
 open('textGaussParLU.txt');
end