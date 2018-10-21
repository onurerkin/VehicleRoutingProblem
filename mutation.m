%DESCRIPTION 


% The mutation function makes population change from a spesific point on.
% That point is obtained randomly and possibility of mutation depends pmut
% input value.(If population row cantains 2 cities, the possibility of mutation is zero.)

function [ population ] = mutation( population,psize,city,inCity,finCity,m,pmut )  
ra=unifrnd(0,1);        
if (ra<pmut)            
for i=1:psize           
       if (population(i,2)==finCity)  
       continue                      
       end
t=1;
while t==1                    
a=randi(city);               
if a~=0 && a~=inCity && a~=finCity   
   loc=find(a==population(i,:));     
   l=length(loc);                    
   if l~=0                          
   mut=population(i,:);                 
   mut(1:loc)=population(i,1:loc) ;
   
   c=2*city-loc+1;
   newpop=createpop(1,city,a,finCity,m );
   mut(loc:end)= newpop(1,1:c);   
   population(i,:)=mut(1,:);
   t=t-1;
   end
end
end    
end    
end
end


