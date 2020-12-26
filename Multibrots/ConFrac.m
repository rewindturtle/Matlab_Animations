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
for n = 0 : 1/60 : 6
    N = n;
    C = a + 1i * b;
    Z = zeros(size(C));
    Zn = zeros(size(C));
    iter = zeros(size(C));
    for jj = 1 : IterNum
        for mm = 1:length(y)
            for nn = 1:length(x)
                Zn(nn,mm) = Z(nn,mm)^N + C(nn,mm);
                if (abs(Zn(nn,mm)) <=2)&&(abs(Zn(nn,mm))> abs(Z(nn,mm)))
                    iter(nn,mm) = abs(Zn(nn,mm));
                elseif abs(Zn(nn,mm)) >= 2
                    iter(nn,mm) = 2.1;
                end
            end
        end
        Z = Zn;
    end

    % plot current fractal
    fig = imagesc(x, y, iter);
    colormap( [ jet ; 0 0 0] );
    caxis manual;
    caxis([0 2]);
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
    pw = p(4);
    ph = p(4);
    pt = min(pw, ph) - 1;
    rect = [1, 1, pw-1, ph-1];
    frame = getframe(gca,rect);
    bb = bb + 1;
    im{bb} = frame2im(frame);
    disp(N);
end

% generate animation
filename = 'Conbrot.gif';
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