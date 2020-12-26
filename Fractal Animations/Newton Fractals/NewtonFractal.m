% clear workspaces
clear
clc

% define real and imaginary parts
x = pi/4 : pi/1600 : 3*pi/4;
y = pi/4 : pi/1600 : 3*pi/4;
[a, b] = meshgrid(x, y);
IterNum = 50;

syms X

%F = vpa( (X^3) - 1 );
%roots = double( solve(F == 0) );
roots = [-12*pi : pi : 12*pi];

bb = 0;

for n = pi/180 : pi/180 : 2*pi
    
N = exp(1i*n);

Z = a + b*1i;
G = zeros(size(Z));

for jj = 1 : IterNum
        Zn = sin(Z);
        dZ = cos(Z);
        Z = Z - N*(Zn./dZ);
        disp(jj);
end

for kk = 1:length(roots)
    G = G + ((abs(Z-roots(kk))) <= 0.1)*kk;
    disp(kk);
end

imagesc(x, y, G);
colormap hsv;
caxis manual;

    caxis([0 length(roots)+1]);
    set(gca,'xtick',[]);
    set(gca,'xticklabel',[]);
    set(gca,'ytick',[]);
    set(gca,'yticklabel',[]);
    set(gca,'visible','off')
    
    axis equal tight
    
    ax = gca;
    ax.Units = 'pixels';
    p = ax.Position;
    pw = p(4);
    ph = p(4);
    pt = min(pw, ph) - 1;
    rect = [1, 1, pw-1, ph-1];
    frame = getframe(gca,rect);
    bb = bb + 1;
    im{bb} = frame2im(frame);
end

filename = 'Newton2.gif';
for ii = 1 : bb
    [A, map] = rgb2ind(im{ii}, 256);
    if ii == 1
        imwrite(A, map, filename, 'gif', 'LoopCount', Inf, 'DelayTime', 1/60);
    else
        imwrite(A, map, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 1/60);
    end
end
shg
disp('DONE!');