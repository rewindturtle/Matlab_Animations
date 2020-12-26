function A = VAg(VL, M1, L1, M2, L2, M3, L3, M4, L4, M5, L5, M6, L6, M7, L7, M8, L8, M9, L9)
    
    G = 6.674*10^-11; %m^3kg^-1s^-2


    xd1 = L1(1,1) - VL(1,1);
    yd1 = L1(1,2) - VL(1,2);
    
    xd2 = L2(1,1) - VL(1,1);
    yd2 = L2(1,2) - VL(1,2);
    
    xd3 = L3(1,1) - VL(1,1);
    yd3 = L3(1,2) - VL(1,2);
    
    xd4 = L4(1,1) - VL(1,1);
    yd4 = L4(1,2) - VL(1,2);
    
    xd5 = L5(1,1) - VL(1,1);
    yd5 = L5(1,2) - VL(1,2);
    
    xd6 = L6(1,1) - VL(1,1);
    yd6 = L6(1,2) - VL(1,2);
    
    xd7 = L7(1,1) - VL(1,1);
    yd7 = L7(1,2) - VL(1,2);
    
    xd8 = L8(1,1) - VL(1,1);
    yd8 = L8(1,2) - VL(1,2);
    
    xd9 = L9(1,1) - VL(1,1);
    yd9 = L9(1,2) - VL(1,2);
    
    r1 = sqrt( (xd1^2) + (yd1^2) );
    r2 = sqrt( (xd2^2) + (yd2^2) );
    r3 = sqrt( (xd3^2) + (yd3^2) );
    r4 = sqrt( (xd4^2) + (yd4^2) );
    r5 = sqrt( (xd5^2) + (yd5^2) );
    r6 = sqrt( (xd6^2) + (yd6^2) );
    r7 = sqrt( (xd7^2) + (yd7^2) );
    r8 = sqrt( (xd8^2) + (yd8^2) );
    r9 = sqrt( (xd9^2) + (yd9^2) );
    
    
    T1 = [cos(atan(yd1/xd1)), sin(atan(yd1/xd1))];
    T2 = [cos(atan(yd2/xd2)), sin(atan(yd2/xd2))];
    T3 = [cos(atan(yd3/xd3)), sin(atan(yd3/xd3))];
    T4 = [cos(atan(yd4/xd4)), sin(atan(yd4/xd4))];
    T5 = [cos(atan(yd5/xd5)), sin(atan(yd5/xd5))];
    T6 = [cos(atan(yd6/xd6)), sin(atan(yd6/xd6))];
    T7 = [cos(atan(yd7/xd7)), sin(atan(yd7/xd7))];
    T8 = [cos(atan(yd8/xd8)), sin(atan(yd8/xd8))];
    T9 = [cos(atan(yd9/xd9)), sin(atan(yd9/xd9))];
    
    
    if xd1 < 0
        T1 = -T1;
    end
    
    if xd2 < 0
        T2 = -T2;
    end
    
    if xd3 < 0
        T3 = -T3;
    end
    
    if xd4 < 0
        T4 = -T4;
    end
    
    if xd5 < 0
        T5 = -T5;
    end
    
    if xd6 < 0
        T6 = -T6;
    end
    
    if xd7 < 0
        T7 = -T7;
    end
    
    if xd8 < 0
        T8 = -T8;
    end
    
    if xd9 < 0
        T9 = -T9;
    end
    
    A1 = ((G*M1)/(r1^2))*T1;
    A2 = ((G*M2)/(r2^2))*T2;
    A3 = ((G*M3)/(r3^2))*T3;
    A4 = ((G*M4)/(r4^2))*T4;
    A5 = ((G*M5)/(r5^2))*T5;
    A6 = ((G*M6)/(r6^2))*T6;
    A7 = ((G*M7)/(r7^2))*T7;
    A8 = ((G*M8)/(r8^2))*T8;
    A9 = ((G*M9)/(r9^2))*T9;
    
    
    A = A1 + A2 + A3 + A4 + A5 + A6 + A7 + A8 + A9;
    
end