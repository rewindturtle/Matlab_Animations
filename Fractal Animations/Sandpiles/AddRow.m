function [B] = AddRow(A,side)
if side == 2
    B = cat(1,zeros(1,size(A,2)),A);
elseif side == 1
    B = cat(1,A,zeros(1,size(A,2)));
end
end