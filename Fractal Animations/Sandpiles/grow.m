function [E] = grow(A)
B = cat(1,zeros(1,size(A,2)),A);
C = cat(1,B,zeros(1,size(B,2)));
D = cat(2,zeros(size(C,1),1),C);
E = cat(2,D,zeros(size(D,1),1));
end