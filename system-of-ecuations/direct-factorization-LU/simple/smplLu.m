%Input :
%A matrix 
%b computable vector with matrix A

%output
%x
%.txt

function [L,U] = smplLu(A)
 format long;
 
 n=size(A,1);
 L=eye(n);
 U=zeros(n);
 M=A;
 
 text = fopen('textSmplLU.txt', 'w');
 fprintf(text, 'Results:\n\n');
 fprintf(text, 'Stage 0\n\n');
 fprintf(text,[repmat('%.6f ', 1,n) '\n'], M');
 fprintf(text,'\n');
 
 for i=1:n-1
     %row change
     if M(i, i)==0 
         fprintf(text, '\nFatal Error \nThere is a 0 in the diagonal.');
         fclose(text);
         open('textGaussSmplLU.txt');
         return;
     end
     %multipliers
     for j=i+1:n
         if M(j, i)~=0
              L(j,i)= M(j,i)/M(i,i);
             M(j,i:n)=M(j, i:n)-((M(j,i)/M(i,i))*M(i,i:n));
              
         end
     end
     U(i,i:n)=M(i,i:n);
     U(i+1, i+1:n)=M(i+1,i+1:n);
     
    fprintf(text,'Stage  %u\n\n', i);
    %fprintf(text,[repmat('%.6f ',1,n) '\n'], M');
    fprintf(text,'\nL:\n');
     
     fprintf(text,[repmat('%.6f ',1,n) '\n'], L');
      fprintf(text,'\nU:\n');
     fprintf(text,[repmat('%.6f ',1,n) '\n'], U');
     fprintf(text,'\n');
 end
 U(n,n)=M(n,n);
 fclose(text);
end