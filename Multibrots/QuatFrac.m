cc = 0;
for kk = -2:0.01:2
b = 0;
list = [0,0,0];
for uu = -2:0.01:2
    for ii = -2:0.01:2
        for jj = -2:0.01:2
            Z = [0,0,0,0];
            for nn = 1:50
                Z = quatmult(Z,Z) + [uu,ii,jj,kk];
            end
            disp([uu,ii,jj]);
            if Z <= 2
               b = b + 1;
               list(b,:) = [uu,ii,jj];
            end
        end
    end
end
X = list(:,1);
Y = list(:,2);
Z = list(:,3);
s = scatter3(X,Y,Z);
s.MarkerFaceColor = [0 0 0.5];
s.MarkerEdgeColor = 'k';
title(sprintf('k = %1.2f', kk), 'fontsize', 16', 'interpreter', 'latex')
axis([-2 1 -1.5 1.5 -1.5 1.5]);
direction = [1 1 1];
rotate(s,direction,4.5*cc);

cc = cc + 1;
frame = getframe(gcf);
im{cc} = frame2im(frame);
end

filename = 'QuatFrac2.gif';
for dd = 1 : cc
    [A, map] = rgb2ind(im{dd}, 256);
    if dd == 1
        imwrite(A, map, filename, 'gif', 'LoopCount', Inf, 'DelayTime', 1/60);
    else
        imwrite(A, map, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 1/60);
    end
end
shg
disp('DONE!');