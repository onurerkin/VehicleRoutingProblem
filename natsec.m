% DESCRIPTION:

% natsec is Natural Selection function that takes population as input
% and creates another population(subpop) by using natural selection
% operation



% OUTPUT: subpop is our output variable. Its usage is the same as population

function [ subpop ] = natsec( population,obj,psize,city )
obj=1./obj;
sumobj=sum(obj);
probs=obj/sumobj;
cprobs=probs;
for i=2:psize
    cprobs(i)=cprobs(i-1)+probs(i);
end

rs=unifrnd(0,1,[psize,1]);
subpop=population;

for i=1:psize
    idx=find(rs(i)<cprobs,1);
    subpop(i,:)=population(idx,:);
    
end





end





