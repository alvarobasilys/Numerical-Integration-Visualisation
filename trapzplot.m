function trapzplot(f,n,a,b)
syms x;

delta = (b-a)/n;
x2 = a:delta:b;
y2 = subs(f,x,x2);
[i,j] = size(x2);

x = [x2(i);x2(i+1);x2(i+1);x2(i)];
y = [0;0;y2(i+1);y2(i)];
y = double(y);
for k = i:1:j-2
    m = [x2(k+1);x2(k+2);x2(k+2);x2(k+1)];
    n = [0;0;y2(k+2);y2(k+1)];
    n = double(n);
    x = [x,m];
    y = [y,n];
end
patch(x,y,'red');
hold on
xlin = linspace(a,b)
ylin = subs(f,xlin)
plot(xlin,ylin,'-')
end