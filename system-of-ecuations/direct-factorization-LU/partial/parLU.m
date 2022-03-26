function [L,U]=parLU(A)
n=size(A,1);
L=eye(n);
U=zeros(n);
P=eye(n);
M=A;

text = fopen('textParLU.txt', 'w');
 fprintf(text, 'Results:\n\n');
 fprintf(text, 'Stage 0\n\n');
 fprintf(text,[repmat('%.6f ', 1,n) '\n'], M');
 fprintf(text,'\n');
 
 for i=1:n-1
     %row change
     [aux0, aux]=max(abs(M(i+1:n,i)));
     
     if aux0>abs(M(i,i))
         M
         P
         M(i+aux,i:n)
         aux2=M(i+aux,i:n);
         
         P(i+aux,:)
         aux3=P(i+aux,:);
         
         M(i,i:n)
         M(aux+i,i:n)=M(i,i:n);
         
         P(i,:)
         P(aux+i,:)=P(i,:);
         
         M(i,i:n)=aux2;
         P(i,:)=aux3;
         
         M
         P
         if i>1
             aux4=L(i+aux,1:i-1);
             L(i+aux,1:i-1)=L(i,1:i-1);
             L(i,1:i-1)=aux4;
         end
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
     
    fprintf(text,'Stage  %u\n', i);
    %fprintf(text,[repmat('%.6f ',1,n) '\n'], M');
    fprintf(text,'\nL:\n');
    fprintf(text,[repmat('%.6f ',1,n) '\n'], L');
     
    fprintf(text,'\nU:\n');
    fprintf(text,[repmat('%.6f ',1,n) '\n'], U');
    
    fprintf(text,'\nP:\n');
    fprintf(text,[repmat('%.6f ',1,n) '\n'], P');
    
    fprintf(text,'\n');
     
 end
end