function [B] = AddColumn(A,side)
if side == 2
    B = cat(2,zeros(size(A,1),1),A);
elseif side == 1
    B = cat(2,A,zeros(size(A,1),1));
end
end