function [U,I,J,K] = quatconvert(a,b,c,d)
U = a*[1, 0; 0, 1];
I = b*[1i, 0; 0, -1i];
J = c*[0, 1; -1, 0];
K = d*[0, 1i; 1i, 0];
Q = [U, I, J, K];
end