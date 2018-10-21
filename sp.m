% DESCRIPTION:

% This function is our main function that contains several functions:
% Functions:
% createpop , objective , natsec , crossover , repair , mutation 



%INPUTS: 
% psize: Population size (must be an even number)

% pcross: probability of cross-over, 
% must be between 0-1 (0.60-0.90 recommended) (0.5 means %50 chance)

% city: # of cities in the network (must be consistent with x and y
%matricies)

% inCity: Starting point
% finCity: Destination point

% m is the multiplied 1 and 0 matricies that indicates the connections
% between cities

% x is the matrix that holds the x axis coordinates of the cities

% y is the matrix that holds the y axis coordinates of the cities

% probability of mutation must be between 
% must be between 0-1 (0.05-0.10 recommended) (0.5 means %50 chance)



% OUTPUT:

% popuation: A matrix that has psize number of solutions of our
% problem

function [population obj] = sp(psize,pcross,city,inCity,finCity,m,x,y,pmut)
x=[2 5 3 6 5 1];
y=[2 2 3 4 7 6];
m=[
[0 1 1 0 0 1;2 0 2 2 0 0;3 3 0 3 0 3;0 4 4 0 4 0;0 0 0 5 0 5;6 0 6 0 6 0]    
];
city =6;
psize=10;
inCity = 3;
finCity=5;
pcross = 0.3;
pmut = 0.05; 
population = createpop(psize,city,inCity,finCity,m,x,y );
inpop = population;

obj=objective( x,y,psize,city,population );
iterasyon=10;
for i=1:iterasyon
population=natsec( population,obj,psize,city );

population=crossover( population,psize,pcross,city,inCity,finCity);
population = repair( population,city,psize,inCity,finCity );
population = mutation( population,psize,city,inCity,finCity,m,pmut );
population = repair( population,city,psize,inCity,finCity );
obj=objective( x,y,psize,city,population );

end
end
