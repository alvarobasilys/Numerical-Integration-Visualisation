function midplot(f,n,a,b)
syms x
delta = (b-a)/n
xn = a+(.5*delta):delta:b-(.5*delta)
yn = subs(f,x,xn)
[i,j] = size(xn)
yn = double(yn)
x = [xn(1)-(delta/2);xn(1)+(delta/2);xn(1)+(delta/2);xn(1)-(delta/2)]
y = [0;0;yn(1);yn(1)]
for k = i+1:1:j
    m = [xn(k)-(delta/2);xn(k)+(delta/2);xn(k)+(delta/2);xn(k)-(delta/2)];
    n = [0;0;yn(k);yn(k)];
    x = [x,m]
    y = [y,n]
end
patch(x,y,'red')
hold on
xlin = linspace(a,b)
ylin = subs(f,xlin)
plot(xlin,ylin,'-')
hold off