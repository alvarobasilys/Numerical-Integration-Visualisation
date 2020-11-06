%Program Titik Tengah
function hasil = midpoint(f,n,a,b)
syms x
h=(b-a)/n;
sum=0.0;
for i=0:n-1
    x2=a+(i+0.5)*h;
    sum=sum+subs(f,x,x2);
end
hasil=h*sum
end
