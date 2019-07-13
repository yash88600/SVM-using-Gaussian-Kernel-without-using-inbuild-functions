function out=similarityfun(x,y,sig)
% gaussian Kernel
out = exp(-(norm(x-y)^2)/sig);


end