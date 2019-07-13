function out=cost0(x)
for i=1:size(x,1)
    if x(i)<=-1
        out(i)=0;
    else
        out(i)=1;
    end
end
end