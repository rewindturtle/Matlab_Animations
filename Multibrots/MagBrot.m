% clear workspaces
delta = 0.01;
xl = -2;
xu = 2;
yl = -2;
yu = 2;

% define real and imaginary parts
x = xl : delta : xu;
y = yl : delta : yu;
[a, b] = meshgrid(x, y);
IterNum = 50;
d = 1/delta;
xint = (1/delta)*(-xl) + 1;
yint = (1/delta)*(-yl) + 1;
bb = 0;

for n = 0:1/30:6
N = n;
C = a + 1i * b;
Z = zeros(size(C));
M = Z;
inside = ones(size(C));
outside = ones(size(C));
iter = zeros(size(C));
for jj = 1 : IterNum
    Z(inside) = Z(inside).^N + C(inside);
    inside = abs(Z) <= 2;
    iter = iter + inside;
   
    
    
    disp(jj);
end

fig = imagesc(x, y, outside);
colormap( jet );
caxis manual;
caxis([0 IterNum]);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
set(gca,'visible','off')
axis equal tight

    ax = gca;
    ax.Units = 'pixels';
    p = ax.Position;
    pw = p(3);
    ph = p(4);
    pt = min(pw, ph) - 1;
    rect = [1, 1, pt, pt];
    frame = getframe(gca,rect);
    bb = bb + 1;
    im{bb} = frame2im(frame);
    disp(n);
end

filename = 'BuddhabrotTest.gif';
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