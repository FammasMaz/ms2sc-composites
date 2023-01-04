function [N,M]=genBehav(Cm, stack, t, nu, ki, alpha1, alpha2, dT)
    [S, A, B, D] = elasBehav(Cm, stack, t);
    [Nth, Mth] = thermBehav(Cm, stack, t, alpha1, alpha2, dT);
    genStress = S*[nu, ki]' - [Nth;Mth];
    N = genStress(1:3);
    M = genStress(4:6);
end

