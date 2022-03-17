

function [L,U] = mthDireLU(A,l)

n=size(A,1);
L=eye(n); U=eye(n);

 text = fopen('textMthDireLU.txt', 'w');
 fprintf(text, 'Results:\n\n');
 fprintf(text, 'Stage 0\n\n');
 fprintf(text,[repmat('%.6f ', 1,n) '\n'], A');
 fprintf(text,'\n');
  
 if l==1 %Doolitle
     for i=1:n-1
         for j=i:n
             A(i,j)-dot(L(i,1:i-1),U(1:i-1,j)')
             U(i,j)=A(i,j)-dot(L(i,1:i-1),U(1:i-1,j)');
         end
         for j=i+1:n
             (A(j,i)-dot(L(j,1:i-1),U(1:i-1,i)'))/U(i,i)
             L(j,i)=(A(j,i)-dot(L(j,1:i-1),U(1:i-1,i)'))/U(i,i);
         end
        fprintf(text,'Stage  %u\n\n', i);
        fprintf(text,'\nL:\n');
        fprintf(text,[repmat('%.6f ',1,n) '\n'], L');
        fprintf(text,'\nU:\n');
        fprintf(text,[repmat('%.6f ',1,n) '\n'], U');
        fprintf(text,'\n');
     end
     U(n,n)=A(n,n)-dot(L(n,1:n-1),U(1:n-1,n)');
     fprintf(text,'Stage  %u\n\n', 4);
     fprintf(text,'\nL:\n');
     fprintf(text,[repmat('%.6f ',1,n) '\n'], L');
     fprintf(text,'\nU:\n');
     fprintf(text,[repmat('%.6f ',1,n) '\n'], U');
     fprintf(text,'\n');    
 elseif l==2 %crout
         for i=1:n-1 %for
             for j=i:n
                 L(j,i)=A(j,i)-dot(L(j,1:i-1),U(1:i-1,i)');
             end
             for j=i+1:n
                 U(i,j)=(A(i,j)-dot(L(i,1:i-1),U(1:i-1,j)'))/L(i,i);
             end
             fprintf(text,'Stage  %u\n\n', i);
             fprintf(text,'\nL:\n');
             fprintf(text,[repmat('%.6f ',1,n) '\n'], L');
             fprintf(text,'\nU:\n');
             fprintf(text,[repmat('%.6f ',1,n) '\n'], U');
             fprintf(text,'\n');
         end
         L(n,n)=A(n,n)-dot(L(n,1:n-1),U(1:n-1,n)');
         fprintf(text,'Stage  %u\n', n);
         fprintf(text,'\nL:\n');
         fprintf(text,[repmat('%.6f ',1,n) '\n'], L');
         fprintf(text,'\nU:\n');
         fprintf(text,[repmat('%.6f ',1,n) '\n'], U');
         fprintf(text,'\n');  
     elseif l==3  %cholesky
         for i=1:n-1
             L(i,i)=sqrt(A(i,i)-dot(L(i,1:i-1),U(1:i-1,i)'));
             U(i,i)=L(i,i);
             for j=i+1:n
                 L(j,i)=(A(j,i)-dot(L(j,1:i-1),U(1:i-1,i)'))/U(i,i);
             end
             for j=i+1:n
                 U(i,j)=(A(i,j)-dot(L(i,1:i-1),U(1:i-1,j)'))/L(i,i);
             end        
     fprintf(text,'Stage  %u\n\n', i);
     fprintf(text,'\nL:\n');
     fprintf(text,[repmat('%.6f ',1,n) '\n'], L');
     fprintf(text,'\nU:\n');
     fprintf(text,[repmat('%.6f ',1,n) '\n'], U');
     fprintf(text,'\n');
         end
    L(n,n)=sqrt(A(n,n)-dot(L(n,1:n-1),U(1:n-1,n)'));
    U(n,n)=L(n,n);
     fprintf(text,'Stage  %u\n\n', 4);
     fprintf(text,'\nL:\n');
     fprintf(text,[repmat('%.6f ',1,n) '\n'], L');
     fprintf(text,'\nU:\n');
     fprintf(text,[repmat('%.6f ',1,n) '\n'], U');
     fprintf(text,'\n');
 end
     fclose(text);
     
     end