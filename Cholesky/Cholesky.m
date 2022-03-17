

function [L,U] = Cholesky(A,b)

n=size(A,1);
L=eye(n); U=eye(n);

 text = fopen('Cholesky.txt', 'w');
 fprintf(text, 'Results:\n\n');
 fprintf(text, 'Stage 0\n\n');
 fprintf(text,[repmat('%.6f ', 1,n) '\n'], A');
 fprintf(text,'\n');
 
   for i=1:n-1
         L(i,i)=sqrt(A(i,i)-dot(L(i,1:i-1),U(1:i-1,i)'));
         U(i,i)=L(i,i);
             
         for j=i+1:n
             L(j,i)=(A(j,i)-dot(L(j,1:i-1),U(1:i-1,i)'))/U(i,i);    
         end
         
         for j=i+1:n
                 U(i,j)=(A(i,j)-dot(L(i,1:i-1),U(1:i-1,j)'))/L(i,i);    
         end  
     L(n,n)=sqrt(A(n,n)-dot(L(n,1:n-1),U(1:n-1,n)'));
     U(n,n)=L(n,n);
     
     fprintf(text,'Stage  %u\n\n', i);
     fprintf(text,'\nL:\n');
     fprintf(text,[repmat('%.6f ',1,n) '\n'], L');
     fprintf(text,'\nU:\n');
     fprintf(text,[repmat('%.6f ',1,n) '\n'], U');
     fprintf(text,'\n');
   end
   
 z=sustProAB(L,b)
 x=sustReAB(U,z)
 fclose(text);
end