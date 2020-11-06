function [area] = trapz(f,n,a,b)
syms x
delta = (b-a)/n;
area = 0;
for i = a:delta:b
    if i == a || i == b
        area = area +subs(f,x,i);
    else
        area = area +2*subs(f,x,i);
    end
end
area = area*delta/2;
end