%Input :
%A matrix 
%b computable vector with matrix A

%output
%x
%.txt

function x = gaussSmpl(A, b)
 format long;
 text = fopen('textGaussSmpl.txt', 'w');
 [m, n]=size(A);
 
 x= zeros(n,1);
 
 if m~=n
     fprintf(text, 'Error \n Matrix ''A'' must be square');
     fclose(text);
     open('textGaussSmpl.txt');
     return;
 end
 if m~=length(b)
     fprintf(text, 'Error \n Wrong vector');
     fclose(text);
     open('textGaussSmpl.txt');
     return;
 end
 
  if det(A)==0
     fprintf(text, 'Error \n Determinant of the matrix must be zero');
     fclose(text);
     open('textGaussSmpl.txt');
     return;
 end
 
 M=[A b];
 
 fprintf(text, 'Results:\n\n');
 fprintf(text, 'Stage 0\n\n');
 fprintf(text,[repmat('%.6f ', 1, n+1) '\n'], M');
 fprintf(text,'\n');
 
 for i=1:n-1
     %row change
     if M(i, i)==0 
         aux=find(M(i+1:n,i)~=0);
         aux2=M(i+aux(1), i:n+1);
         M(aux(1)+i,i:n+1)=M(i,i:n+1);
         M(i,i:n+1)=aux2;
     end
     %multipliers
     for j=i+1:n
         if M(j, i)~=0
             M(j,i:n+1)=M(j, i:n+1)-((M(j,i)/M(i,i))*M(i,i:n+1));
         end
         
     end
     
     fprintf(text,'Stage  %u\n\n', i);
     fprintf(text,[repmat('%.6f ', 1, n+1) '\n'], M');
     fprintf(text,'\n');
     
 end
 
 x=sustRegr(M);
 fprintf(text, '\n With progressive replacement\n\n');
 fprintf(text, 'x:\n');
 fprintf(text, '%.6f\n',x);
 
 fclose(text);
 % open('textGaussSmpl.txt');
end