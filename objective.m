% DESCRIPTION:

% This function is our objective calculator, in our case objective is the
% distance from starting point to the destination city.

% OUTPUT:

% obj is a psize x 1 matrix that holds the objective value of each cromosom
% in population.

function [ obj ] = objective( x,y,psize,city,population )

obj=zeros(psize,1);
for i=1:psize
    for j=1:city 
       if(j)~=(city)        
idx1=population(i,j);   %bu ad?m di?er t?m yollar i?in.
idx2=population(i,j+1);
       else
           break
       end
if idx2==0
    break
end
obj(i)=sqrt((x(idx1)-x(idx2))^2+(y(idx1)-y(idx2))^2)+obj(i);
      
    end


end
end






