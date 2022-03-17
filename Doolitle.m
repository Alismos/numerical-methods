function [L,U] = Doolitle(A)

n=size(A,1);
L=eye(n); U=eye(n);

 text = fopen('Doolitle.txt', 'w');
 fprintf(text, 'Results:\n\n');
 fprintf(text, 'Stage 0\n\n');
 fprintf(text,[repmat('%.6f ', 1,n) '\n'], A');
 fprintf(text,'\n');
  
 
     for i=1:n-1
         for j=i:n
            U(i,j)=A(i,j)-dot(L(i,1:i-1),U(1:i-1,j)');
         end
         for j=i+1:n
             L(j,i)=(A(j,i)-dot(L(j,1:i-1),U(1:i-1,i)'))/U(1,1);
             
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
     fclose(text);
  end