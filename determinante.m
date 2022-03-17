function deter = determinante(A)
  [rows,cols] = size(A);
  if rows ~= cols
    disp('Debe de ser una matriz cuadrada')
  else
    if rows == 2
      deter = A(1,1)*A(2,2)-A(1,2)*A(2,1);
    else
      deter = 0;
      for i = 1:cols
        if i == 1
          A_new = A(2:rows,2:cols);
          deter = deter + ((-1)^(i+1))*A(1,i)*determinante(A_new);
        else
          A_new = [A(2:rows,1:i-1),A(2:rows,i+1:cols)];
          deter = deter + ((-1)^(i+1))*A(1,i)*determinante(A_new);
        end
      end
    end
  end
end