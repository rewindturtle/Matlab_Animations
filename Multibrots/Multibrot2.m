% clear workspaces
clear
clc
% define real and imaginary parts
x = -2 : 0.005 : 2;
y = -2 : 0.005 : 2;
[a, b] = meshgrid(x, y);
IterNum = 50;

% loop through different exponents
bb = 0;
for n = pi/180 : pi/180 : 2*pi
    N = exp(1i*n);
    C = a + 1i * b;
    Z = zeros(size(C));
    inside = ones(size(C));
    iter = zeros(size(C));
    for jj = 1 : IterNum
        Z(inside) = asin(N.*Z(inside)) + C(inside);
        inside = abs(Z) <= 2;
        iter = iter + inside;
    end

    % plot current fractal
    fig = imagesc(x, y, iter);
    colormap( [ jet ; 0 0 0] );
    caxis manual;
    caxis([0 IterNum]);
    set(gca,'xtick',[]);
    set(gca,'xticklabel',[]);
    set(gca,'ytick',[]);
    set(gca,'yticklabel',[]);
    set(gca,'visible','off')
    
    axis equal tight
    %title(sprintf('$z_{n+1} = cos(e^{%1.3f}z_n) + c$', n), 'fontsize', 16', 'interpreter', 'latex')
    %xlabel('$\mathrm{Re}(z)$', 'fontsize', 16, 'interpreter', 'latex')
    %ylabel('$\mathrm{Im}(z)$', 'fontsize', 16, 'interpreter', 'latex')
    
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
    filename = sprintf('Multibrot%i.jpg', bb);
    [A, map] = rgb2ind(im{bb}, 256);
    imwrite(A, map, filename);
end

disp('DONE!');