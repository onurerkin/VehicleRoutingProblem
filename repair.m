% DESCRIPTION:

% The main usage of this function is to repair infeasible chromosomes which
% are not satisfying our condition .


% Example:

% chromosome1=[4 2 1 5 6 2 3]  as can be seen there is a loop in this
% solution which is not acceptable. The repaired choromosome should be
% something like that choromosome1(repaired)=[4 2 3]

function [ population] = repair( population,city,psize,inCity,finCity )

for i=1:psize 
    repsolution=population(i,:);
    for j=2:2*city 
        if population(i,j) == 0 ||  population(i,j)==finCity
            break
        else
        num=population(i,j);
        a=find(num==population(i,:));
        l=0;
        l=length(a);
        if l>1 
            repsolution(1:a(1))=population(i,1:a(1));
            k=2*city-a(l)-1;
            repsolution(a(1)+1:a(1)+1+k)=population(i,a(l)+1:end);
            repsolution(a(1)+2+k:end)=zeros;
        end    
        end
    end
    population(i,:)=repsolution;
end
end

