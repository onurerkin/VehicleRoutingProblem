%DESCRIPTION 


% The crossover function generates 2 children from 2 parents.There will be
% crossover only if there is a common gene in both parents except starting
% and destination point genes.But there is no requirement that the genes
% need to be located at the same column.
% Example: P1: 2 4 5 6 0 0 P2: 2 3 4 6 0 0
%          C1:2 4 6 0 0 0  C2: 2 3 4 5 6 0 


function [subpop ] = crossover( population,psize,pcross,city,inCity,finCity)
pairs=randperm(psize);

for i=1:psize/2               
    idx1=pairs(2*i-1);
    idx2=pairs(2*i);
    parent1=population(idx1,:);
    parent2=population(idx2,:);
    rs=unifrnd(0,1);  
    children1=parent1;  
    children2=parent2; 
    if(rs<pcross)   
        ia=randperm(city*2);
        spar2=parent2(ia);
        a=1;
 while a<=2*city
     for b=2:2*city
       if ( parent1(b)==spar2(a) && spar2(a)~= 0 && spar2(a)~=inCity  && spar2(a)~= finCity )
           t=parent1(b);
           loc=find(parent2==t,1);
           children1=parent1;
           children2=parent2;
           c1=city-loc;
           c2=city-b;
           children1(b+1:b+c1)=parent2(loc+1:city);
           children1(b+c1+1:end)=zeros;  
           children2(loc+1:loc+c2)=parent1(b+1:city);
           children2(loc+c2+1:end)=zeros;
           a=2*city+1;
           break
       end     
     end
     a=a+1;
 end
        subpop(idx1,:)=children1;
        subpop(idx2,:)=children2;
    else
        children1=parent1;
        children2=parent2;
        subpop(idx1,:)=parent1;
        subpop(idx2,:)=parent2;
    end    
end
end

           
        
      