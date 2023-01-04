function rlxGenStrn=relaxGenStrn(Cm, stack, t, alpha1, alpha2, dT)
    [S, A, B, D] = elasBehav(Cm, stack, t);
    [Nth, Mth] = thermBehav(Cm, stack, t, alpha1, alpha2, dT);

    rlxGenStrn = inv(S)*[Nth;Mth]
end
