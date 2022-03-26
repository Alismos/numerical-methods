function x=sustReAB(A,b)
n=size(A,1)
% se calcula x(n) de la ultima ecuacion
x(n)=b(n)/A(n,n)
% se calcula x(k) de la ecuacion k
for k=n-1:-1:1
s=0;
for i=k+1:n
s=s+A(k,i)*x(i);
end
x(k)=(b(k)-s)/A(k,k);
x=transpose(x);
end