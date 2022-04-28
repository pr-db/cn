clc;
clear all;
close all;

graph = [
    [0 2 4 0 0 0];
    [2 0 1 7 0 0];
    [4 1 0 0 3 0];
    [0 7 0 0 2 1];
    [0 0 3 2 0 5];
    [0 0 0 1 5 0];
];

%% Print Graph
i=1;
x=1;
temp=triu(graph); %for coloring of the lines after computing path

for i=1:6
     for j=1:6
         if(temp(i,j)~=0)
             lc(i,j)=x;      %just numbering in sequence for line count
             lc(j,i)=lc(i,j);
             x=x+1;      
         end
     end
end

bg=biograph(triu(graph),[],'showarrows','off','ShowWeights','on','EdgeTextColor',[0 0 1]);
view(bg);

%% Shortest path 
cost = Inf(1, 6);
known = false(1, 6);
path = zeros(1, 6);
cost(1) = 0;

for i=1:6
    disp([' Known ', ' Cost ', ' Path']);
    disp([known; cost; path]');
    min_val = 1/0;
    vertex=0;
    for j=1:6
        if((~known(j)) && (cost(j) < min_val))
            min_val = cost(j);
            vertex = j;
        end
    end
    
    known(vertex) = 1;
    
    for j=1:6
        if((~known(j)) && (graph(vertex,j) ~= 0))
            if(graph(vertex, j) + cost(vertex) < cost(j))
                cost(j) = graph(vertex, j) + cost(vertex);
                path(j) = vertex;
            end
        end
    end
end
disp([' Known ', ' Cost ', ' Path']);
disp([known; cost; path]');