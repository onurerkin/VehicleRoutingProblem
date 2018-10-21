% This function is an initial population creator
% (Created inital population has no loops)



% OUTPUT:

% popuation: A matrix that have psize number of solutions of our
% problem

function [ population] = createpop(psize,city,inCity,finCity,m,x,y )


population=zeros(psize,city*2);
i=1;
while(i<=psize)  
    solution=zeros(1,city);
    solution(1)=inCity;
    a=m;
    for j=2:city 
        k=solution(j-1); 
       iht=transpose(a(:,k)); 
       s=1;
       if iht==zeros(1,city);
           i=i-1;
           s=0;
           break    
       end
       next=0;
       while(next==0)
       r=randi(city);
       next=iht(r);
       end
       solution(j)=next;
        if solution(j)==finCity
            break
        end
        a(k,:)=0;
    end
    if s ~= 0
    population(i,1:city)=solution;
    end
    i=i+1;
    end
end

