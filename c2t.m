function [t] = c2t(a,b,size)
for i=1:size
    if a(i)==1
        t(i)=0;
    else
        t(i)=abs(log10(b(i)));
    end
end
