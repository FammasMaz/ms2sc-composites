function Cm=rigidCm(E1, E2, nu12, G12)
    
    nu21 = nu12*E2/E1;
    rat = 1-(nu12*nu21);
    Cm = [E1/rat nu12*E2/rat 0
        nu21*E1/rat E2/rat 0
        0 0 G12];
end

