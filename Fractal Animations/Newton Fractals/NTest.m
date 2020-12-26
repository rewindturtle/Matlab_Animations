x = -2 : 0.01 : 2;
y = -2 : 0.01 : 2;
[a, b] = meshgrid(x, y);
    Z = a+1i*b;
for ii = 1:1:1000
    Z = Z - (Z-Z.^-2)/3;
end
RZ = real(Z);
IZ = imag(Z);
Rt1 = sqrt((abs(1-RZ)).^2+(abs(0-IZ)).^2);
Rt2 = sqrt((abs(-0.5-RZ)).^2+(abs((sqrt(3)/2)-IZ)).^2);
Rt3 = sqrt((abs(-0.5-RZ)).^2+(abs((-sqrt(3)/2)-IZ)).^2);
Fractal = zeros(size(Z));
Fractal = Fractal + 3*(Rt1 < 0.1);
Fractal = Fractal + 2*(Rt2 < 0.1);
Fractal = Fractal + (Rt3 < 0.1);
imagesc(Fractal);
axis equal tight
colormap(hsv);


