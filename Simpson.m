function hasil = Simpson(f,n,a,b)
syms x

delta = (b-a)/n
x2 = a:delta:b
sum = subs(f,x,a)+subs(f,x,b)
[i,j] = size(x2)
for k = i+1:1:j-1
    if mod(k,2) == 0
        sum = sum + 4*subs(f,x,x2(k))
    else
        sum = sum+2*subs(f,x,x2(k))
    end
end

hasil = delta*sum/3
        