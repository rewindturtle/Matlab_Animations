%Initial Pile
C = [0 0 0;0 20 0;0 0 0];
done = 0;
iter = 0;
while done == 0
    iter = iter + 1;
    D = zeros(size(C));
    a = 0;
    b = 0;
    for n = 1:1:size(C,1)
        for m = 1:1:size(C,2)
            if C(n,m) > 3
                if m+b+1 > size(D,2)
                    D = cat(2,D,zeros(size(D,1),1));
                end
                 if n+a+1 > size(D,1)
                    D = cat(1,D,zeros(1,size(D,2)));
                end
                if m+b == 1
                    D = cat(2,zeros(size(D,1),1),D);
                    b = b+1;
                end
                if n+a == 1
                    D = cat(1,zeros(1,size(D,2)),D);
                    a = a+1;
                end
                D(n+a,m+b) = C(n,m)-4;
                D(n+a+1,m+b) = D(n+a+1,m+b)+1;
                D(n+a-1,m+b) = D(n+a-1,m+b)+1;
                D(n+a,m+b+1) = D(n+a,m+b+1)+1;
                D(n+a,m+b-1) = D(n+a,m+b-1)+1;
            elseif C(n,m) <= 3
                D(n+a,m+b) = D(n+a,m+b) + C(n,m);
            end
        end
    end
    C = D;

    if sum(C>=4) == 0
        done = 1;
    end
end
imagesc(C);
axis equal tight
colorbar