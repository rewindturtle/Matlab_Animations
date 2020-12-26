G = 6.674*10^-11; %m^3kg^-1s^-2

Sf = 1;

Date = datetime([1977,08,19]);

SunM = 1.98855*10^30; %kg
SunR = 696392 *10^3; %m
SunL = [0,0]; %m
SunV = [0,0]; %m/s
txtS = ' Sun';

EarthM = 5.97237*10^24; %kg
EarthR = 6356.8*10^3; %m
EL = 149598023*(10^3);
EV = sqrt(G*SunM/EL);
EarthL = [EL*cos(0), EL*sin(0)]; %m
EarthV = [-EV*sin(0.08)*Sf, EV*cos(0.08)*Sf]; %m/s
txtE = ' Earth';

MercuryM = 3.3011*10^23;
MercuryR = 2439.7*10^3;
MeL = 46001200*(10^3);
MeV = sqrt(G*SunM/MeL);
MercuryL = [MeL*cos(5.8), MeL*sin(5.8)];
MercuryV = [-MeV*sin(5.8)*Sf, MeV*cos(5.8)*Sf];
txtMe = ' Mercury';

VenusM = 4.8675*10^24;
VenusR = 6051.8*10^3;
VL = 108208000*(10^3);
VV = sqrt(G*SunM/VL);
VenusL = [VL*cos(pi/2), VL*sin(pi/2)];
VenusV = [-VV*sin(pi/2)*Sf, VV*cos(pi/2)*Sf];
txtV = ' Venus';

MarsM = 6.4171*10^23;
MarsR = 3389.5*10^3;
MaL = 227939200*(10^3);
MaV = sqrt(G*SunM/MaL);
MarsL = [MaL*cos(0.965), MaL*sin(0.965)];
MarsV = [-MaV*sin(0.965)*Sf, MaV*cos(0.965)*Sf];
txtMa = ' Mars';

JupiterM = 1.8982*10^27;
JupiterR = 69911*10^3;
JL = 778.57*(10^9);
JV = sqrt(G*SunM/JL);
JupiterL = [JL*cos(1.815), JL*sin(1.815)];
JupiterV = [-JV*sin(1.815)*Sf, JV*cos(1.815)*Sf];
txtJ = ' Jupiter';

SaturnM = 5.6834*10^26;
SaturnR = 58232*10^3;
SL = 1433.53*(10^9);
SV = sqrt(G*SunM/SL);
SaturnL = [SL*cos(2.655), SL*sin(2.655)];
SaturnV = [-SV*sin(2.655)*Sf, SV*cos(2.655)*Sf];
txtSa = ' Saturn';

UranusM = 8.6810*10^25;
UranusR = 25362*10^3;
UL = 2875.04*(10^9);
UV = sqrt(G*SunM/UL);
UranusL = [UL*cos(3.3955), UL*sin(3.3955)];
UranusV = [-UV*sin(3.3955)*Sf, UV*cos(3.3955)*Sf];
txtU = ' Uranus';

NeptuneM = 1.0243*10^26;
NeptuneR = 24622*10^3;
NL = 4350*(10^9);
NV = sqrt(G*SunM/NL);
NeptuneL = [NL*cos(3.794), NL*sin(3.794)];
NeptuneV = [-NV*sin(3.794)*Sf, NV*cos(3.794)*Sf];
txtN = ' Neptune';

VoyagerL = EarthL + [0, 10*EarthR];
VoyagerV = [0, 11500 + EV];
VoyagerM = 721.9;
txtVo = 'Voyager 2';

VPath = [0,0];

Voy1L = EarthL + [0, 10*EarthR];
V1V = 11000;
Voy1V = 0;
Voy1M = 721.9;
txtVo1 = 'Voyager 1';

V1Path = [0,0];

dt = 21600;
tmax = 500*4*dt;

bb = 0;
cc = 0;
for t = 0:dt:tmax
    
    cc = cc + 1;
    
    if mod(t,dt*4) == 0
        Date = dateshift(Date,'start','day','next');
    end
 
    EarthA = Ag(EarthL, SunM, SunL, MercuryM, MercuryL, VenusM, VenusL, MarsM, MarsL, JupiterM, JupiterL, SaturnM, SaturnL, UranusM, UranusL, NeptuneM, NeptuneL);
    EarthV = dt*EarthA + EarthV;
    EarthAng = atan(EarthL(1,2)/EarthL(1,1));
    
    
    MercuryA = Ag(MercuryL, SunM, SunL, EarthM, EarthL, VenusM, VenusL, MarsM, MarsL, JupiterM, JupiterL, SaturnM, SaturnL, UranusM, UranusL, NeptuneM, NeptuneL);
    MercuryV = dt*MercuryA + MercuryV;
    
    %%%%
    VenusA = Ag(VenusL, SunM, SunL, EarthM, EarthL, MercuryM, MercuryL, MarsM, MarsL, JupiterM, JupiterL, SaturnM, SaturnL, UranusM, UranusL, NeptuneM, NeptuneL);
    VenusV = dt*VenusA + VenusV;
    %%%%
    
    MarsA = Ag(MarsL, SunM, SunL, EarthM, EarthL, MercuryM, MercuryL, VenusM, VenusL, JupiterM, JupiterL, SaturnM, SaturnL, UranusM, UranusL, NeptuneM, NeptuneL);
    MarsV = dt*MarsA + MarsV;
    
    
    JupiterA = Ag(JupiterL, SunM, SunL, EarthM, EarthL, MercuryM, MercuryL, VenusM, VenusL, MarsM, MarsL, SaturnM, SaturnL, UranusM, UranusL, NeptuneM, NeptuneL);
    JupiterV = dt*JupiterA + JupiterV;
    
    
    SaturnA = Ag(SaturnL, SunM, SunL, EarthM, EarthL, MercuryM, MercuryL, VenusM, VenusL, MarsM, MarsL, JupiterM, JupiterL, UranusM, UranusL, NeptuneM, NeptuneL);
    SaturnV = dt*SaturnA + SaturnV;
    
    
    UranusA = Ag(UranusL, SunM, SunL, EarthM, EarthL, MercuryM, MercuryL, VenusM, VenusL, MarsM, MarsL, JupiterM, JupiterL, SaturnM, SaturnL, NeptuneM, NeptuneL);
    UranusV = dt*UranusA + UranusV;
    
    
    NeptuneA = Ag(NeptuneL, SunM, SunL, EarthM, EarthL, MercuryM, MercuryL, VenusM, VenusL, MarsM, MarsL, JupiterM, JupiterL, SaturnM, SaturnL, UranusM, UranusL);
    NeptuneV = dt*NeptuneA + NeptuneV;
    
    
    SunA = Ag(SunL, EarthM, EarthL, MercuryM, MercuryL, VenusM, VenusL, MarsM, MarsL, JupiterM, JupiterL, SaturnM, SaturnL, UranusM, UranusL, UranusM, UranusL);
    SunV = dt*SunA + SunV;
    
    if (t > 60480000)&&(t < 60480000 + 86400)
        VoyagerA = VAg(VoyagerL, SunM, SunL, EarthM, EarthL, MercuryM, MercuryL, VenusM, VenusL, MarsM, MarsL, JupiterM, JupiterL, SaturnM, SaturnL, UranusM, UranusL, UranusM, UranusL) + [-25/VoyagerM, -18/VoyagerM];
    disp('NOW1!');
    disp(t/(4*dt));
    elseif (t > 126748800)&&(t < 126748800 + 86400)
        VoyagerA = VAg(VoyagerL, SunM, SunL, EarthM, EarthL, MercuryM, MercuryL, VenusM, VenusL, MarsM, MarsL, JupiterM, JupiterL, SaturnM, SaturnL, UranusM, UranusL, UranusM, UranusL) + [-5.5/VoyagerM, 0/VoyagerM];
    disp('NOW2!');
    disp(t/(4*dt));
    elseif (t > 268920000)&&(t < 268920000 + 86400)
        VoyagerA = VAg(VoyagerL, SunM, SunL, EarthM, EarthL, MercuryM, MercuryL, VenusM, VenusL, MarsM, MarsL, JupiterM, JupiterL, SaturnM, SaturnL, UranusM, UranusL, UranusM, UranusL) + [10/VoyagerM, -47/VoyagerM];
    disp('NOW3!');
    disp(t/(4*dt));
    else
        VoyagerA = VAg(VoyagerL, SunM, SunL, EarthM, EarthL, MercuryM, MercuryL, VenusM, VenusL, MarsM, MarsL, JupiterM, JupiterL, SaturnM, SaturnL, UranusM, UranusL, UranusM, UranusL);
    end
    
    VoyagerV = dt*VoyagerA + VoyagerV;
    
    if t == dt*6
        Voy1L = EarthL + [0, 10*EarthR];
        Voy1V = [-V1V*sin(0.59) + EarthV(1,1), V1V*cos(0.59) + EarthV(1,2)];
    end
    
    if (t > 564*4*dt)&&(t < 564*4*dt + 86400*4)
        Voy1A = VAg(Voy1L, SunM, SunL, EarthM, EarthL, MercuryM, MercuryL, VenusM, VenusL, MarsM, MarsL, JupiterM, JupiterL, SaturnM, SaturnL, UranusM, UranusL, UranusM, UranusL) + [0/Voy1M, 1.3/Voy1M];
    disp('NOW4!');
    disp(t/(4*dt));
    Voy1V = dt*Voy1A + Voy1V;
    elseif (t > dt*70)&&((t < 564*4*dt)||(t > 564*4*dt + 86400))
        Voy1A = VAg(Voy1L, SunM, SunL, EarthM, EarthL, MercuryM, MercuryL, VenusM, VenusL, MarsM, MarsL, JupiterM, JupiterL, SaturnM, SaturnL, UranusM, UranusL, UranusM, UranusL);
        Voy1V = dt*Voy1A + Voy1V;
    end
    
     
    
    VoyagerL = dt*VoyagerV + VoyagerL;
    Voy1L = dt*Voy1V + Voy1L;
    SunL = dt*SunV + SunL;
    MercuryL = dt*MercuryV + MercuryL;
    EarthL = dt*EarthV + EarthL;
    VenusL = dt*VenusV + VenusL;
    MarsL = dt*MarsV + MarsL;
    JupiterL = dt*JupiterV + JupiterL;
    SaturnL = dt*SaturnV + SaturnL;
    UranusL = dt*UranusV + UranusL;
    NeptuneL = dt*NeptuneV + NeptuneL;
    
    VPath(cc,1) = VoyagerL(1,1);
    VPath(cc,2) = VoyagerL(1,2);
    
    V1Path(cc,1) = Voy1L(1,1);
    V1Path(cc,2) = Voy1L(1,2);
    
    
    if mod(t,dt*12) == 0
    
        bb = bb + 1;
    
    Voyager = scatter(VoyagerL(1,1), VoyagerL(1,2), 1, [1,1,1], 'filled');
    hold on
    
    Voy1 = scatter(Voy1L(1,1), Voy1L(1,2), 1, [1,1,1], 'filled');
    hold on
    
    Sun = scatter(SunL(1,1), SunL(1,2), 10, [1,0.8,0], 'filled');
    hold on
    
    Earth = scatter(EarthL(1,1), EarthL(1,2), 1, [0,0.5,0.8], 'filled');
    hold on
    
    Mercury = scatter(MercuryL(1,1), MercuryL(1,2), 1, [0.5,0.5,0.5], 'filled');
    hold on
    
    Venus = scatter(VenusL(1,1), VenusL(1,2), 1, [1, 0.5, 0], 'filled');
    hold on
    
    Mars = scatter(MarsL(1,1), MarsL(1,2), 1, [1,0,0], 'filled');
    hold on
    
    Jupiter = scatter(JupiterL(1,1), JupiterL(1,2), 3, [1,0.7,0], 'filled');
    hold on
  
    Saturn = scatter(SaturnL(1,1), SaturnL(1,2), 1, [1,0.8,0], 'filled');
    hold on
    
    SaturnRing = scatter(SaturnL(1,1), SaturnL(1,2), 5, [1,0.8,0]);
    hold on
    
    Uranus = scatter(UranusL(1,1), UranusL(1,2), 1, [0,1,1], 'filled');
    hold on
    
    Neptune = scatter(NeptuneL(1,1), NeptuneL(1,2), 1, [0,0,1], 'filled');
    hold on

    VP = plot(VPath(:,1), VPath(:,2));
    VP.Color = 'w';
    
    V1P = plot(V1Path(:,1), V1Path(:,2));
    V1P.Color = 'w';
    
    
    T = text(VoyagerL(1,1), VoyagerL(1,2), txtVo);
    T.HorizontalAlignment = 'left';
    T.VerticalAlignment = 'bottom';
    T.Color = 'w';
    hold on
    
    T = text(Voy1L(1,1), Voy1L(1,2), txtVo1);
    T.HorizontalAlignment = 'left';
    T.VerticalAlignment = 'bottom';
    T.Color = 'w';
    hold on
    
    T = text(SunL(1,1), SunL(1,2), txtS);
    T.HorizontalAlignment = 'left';
    T.VerticalAlignment = 'bottom';
    T.Color = 'w';
    hold on
    
    T = text(EarthL(1,1), EarthL(1,2), txtE);
    T.HorizontalAlignment = 'left';
    T.VerticalAlignment = 'bottom';
    T.Color = 'w';
    hold on
    
    T = text(MercuryL(1,1), MercuryL(1,2), txtMe);
    T.HorizontalAlignment = 'left';
    T.VerticalAlignment = 'bottom';
    T.Color = 'w';
    hold on
    
    T = text(VenusL(1,1), VenusL(1,2), txtV);
    T.HorizontalAlignment = 'left';
    T.VerticalAlignment = 'bottom';
    T.Color = 'w';
    hold on
    
    T = text(MarsL(1,1), MarsL(1,2), txtMa);
    T.HorizontalAlignment = 'left';
    T.VerticalAlignment = 'bottom';
    T.Color = 'w';
    hold on
    
    T = text(JupiterL(1,1), JupiterL(1,2), txtJ);
    T.HorizontalAlignment = 'left';
    T.VerticalAlignment = 'bottom';
    T.Color = 'w';
    hold on
    
    T = text(SaturnL(1,1), SaturnL(1,2), txtSa);
    T.HorizontalAlignment = 'left';
    T.VerticalAlignment = 'bottom';
    T.Color = 'w';
    hold on
    
    T = text(UranusL(1,1), UranusL(1,2), txtU);
    T.HorizontalAlignment = 'left';
    T.VerticalAlignment = 'bottom';
    T.Color = 'w';
    hold on
    
    T = text(NeptuneL(1,1), NeptuneL(1,2), txtN);
    T.HorizontalAlignment = 'left';
    T.VerticalAlignment = 'bottom';
    T.Color = 'w';
    hold on
    
    x = log((cc/250)+exp(1))*(-300*10^9) + ((VoyagerL(1,1)) + (Voy1L(1,1)))/2;
    y = log((cc/250)+exp(1))*(-300*10^9) + ((VoyagerL(1,2)) + (Voy1L(1,2)))/2;
    xd = log((cc/250)+exp(1))*(300*10^9) + ((VoyagerL(1,1)) + (Voy1L(1,1)))/2;
    yd = log((cc/250)+exp(1))*(300*10^9) + ((VoyagerL(1,2)) + (Voy1L(1,2)))/2;
    
    Dx = (x+xd)/2;
    Dy = yd;
    
    D = text(Dx, Dy, char(Date));
    D.HorizontalAlignment = 'center';
    D.VerticalAlignment = 'top';
    D.Color = 'w';
    hold on
    
    %axis([-400*10^9, 400*10^9, -400*10^9, 400*10^9]);
    
    

axis square
axis([x, xd, y, yd]);
set(gca,'Color','k');
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);

X = figure;

    frame = imcrop(X, [x, y, xd, yd]);
    im{bb} = frame2im(frame);

hold off
    end
    
%disp(t/(4*dt));
%disp(Date);

end


filename = 'SolarSystem1.gif';
for ii = 1 : bb
    [A, map] = rgb2ind(im{ii}, 256);
    if ii == 1
        imwrite(A, map, filename, 'gif', 'LoopCount', Inf, 'DelayTime', 1/60);
    else
        imwrite(A, map, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 1/60);
    end
end

disp('DONE!');