%Input :
%A matrix 
%b computable vector with matrix A

%output
%x
%.txt

function x = gaussPivTot(A, b)
 format long;
 text = fopen('textGaussPivTot.txt', 'w');
 [m, n]=size(A);
 
 x= zeros(n,1);
 
 if m~=length(b)
     fprintf(text, 'Error \n Wrong vector');
     fclose(text);
     open('textGaussPivTot.txt');
     return;
 end
 
 
 if m~=n
     fprintf(text, 'Error \n Matrix ''A'' must be square');
     fclose(text);
     open('textGaussPivTot.txt');
     return;
 end
 
  if det(A)==0
     fprintf(text, 'Error \n Determinant of the matrix must be zero');
     fclose(text);
     open('textGaussPivTot.txt');
     return;
 end
 
 M=[A b];
 
 fprintf(text, 'Results:\n\n');
 fprintf(text, 'Stage 0\n\n');
 fprintf(text,[repmat('%.6f ', 1, n+1) '\n'], M');
 fprintf(text,'\n');
 
 for i=1:n-1
     %Cambio de columna
         [vales, row] = max(abs(M(i:n,i:n)));
         [~,col]=max(vales);
         row = row(col);
         tempMasx= max(vales)
         temp123 = col+(i-1)
         auxCol=M(1:n,col+(i-1));
         M(1:n,col+(i-1))=M(1:n,i);
         M(1:n,i)=auxCol;
         
     %Cambio de fila
         auxRow=M(row+(i-1),i:n+1);
         M(row+(i-1),i:n+1)=M(i,i:n+1);
         M(i, i:n+1)=auxRow;
    
     for j=i+1:n
         
         if M(j, i)~=0
             M(j,i:n+1)=M(j, i:n+1)-((M(j,i)/M(i,i))*M(i,i:n+1));
         end
     end
     fprintf(text,'Stage %u\n\n', i);
     fprintf(text,[repmat('%.6f ', 1, n+1) '\n'], M');
     fprintf(text,'\n');
     
 end
 x=sustRegr(M);
 fprintf(text, '\n With progressive replacement\n\n');
 fprintf(text, 'x:\n');
 fprintf(text, '%.6f\n',x);
 
 fclose(text);
 % open('textGaussPivTot.txt');
end