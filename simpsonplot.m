function simpsonplot(f,n,a,b)
syms x;
% f = -(x^3+x^2+5);
% n = 2;
% a = -2;
% b = 4;

delta = (b-a)/n;
x2 = a:delta:b;
y2 = subs(f,x,x2);
y2 = double(y2);
[i,j] = size(x2);

plot(x2,y2,'o','color','r')
hold on
xnorm = a:(b-a)/30:b;
y3 = subs(f,x,xnorm);
y3 = double(y3);
plot(xnorm,y3,'-')

h = [];
hx = [0;0;0];
hold on
for i = i:2:j-2
    p = [x2(i),y2(i)];
    q = [x2(i+1),y2(i+1)];
    r = [x2(i+2),y2(i+2)];
    h = [h,parabolla(p,q,r)];
end
[i,j] = size(h)
for i = i:1:j
    delta = (b-a)/(30);
    x2 = a:delta:b;
    y = subs(h(i),x,x2);
    plot(x2,y,'.');
end
hold off
end