clear
clc
% Enter the name of data file 
DATA=load('ex6data3.mat');   % importing the data
x=DATA.X;
y=DATA.y;
m=size(x);
hold on
% plotting data
for i=1:m(1) 
    if (y(i)==1)
        plot(x(i,1),x(i,2),'r+')
    end
   
    if (y(i)==0)
        plot(x(i,1),x(i,2),'bo')
    end 
end


alpha=0.01;  % learning rate 
C=1;    
theta=rand(m(1)+1,1)-0.5; % variables
sigma=0.01;               % parameter for Gaussian Kernel

% finding the similarity paramters using Gaussian Kernel
for i=1:m
    for j=1:m
       
        F(i,j)=similarityfun(x(i,:),x(j,:),sigma);
        
    end 
end
F= [ones(m(1),1) F];

% minimising the variables 
for i=1:2000  % no of iterations
    
   grad=C*F'*(y.*(cost1(F*theta))' + (1-y).*((cost0(F*theta)))');
   k1=theta(1);
   theta(1)=0;
   grad=grad+ theta;
   theta(1)=k1;
   
   theta =theta - alpha*grad;
   i 
end

hold on

% plotting the decision boundary(instead of plotting the exact decision....
% boundary we are plotting the cluster having output equals to zero)

%NOTE :  change the range of x1 and x2 acc to the max/min value of data set

for x1=-0.6:0.01:0.6
    for x2=-0.6:0.01:0.6
        Z=[x1 x2];
        k=zeros(1,m(1));
        for j=1:m(1)
            k(j)=similarityfun(Z,x(j,:),sigma);
        end
         k=[ones(1) k];
        check=k*theta;
              if (check>=0)
                  plot(x1,x2,'b.');
              end
    end
end
