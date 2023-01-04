function Ex = elasEx(Cm, theta)
    Cp = rigidCp(Cm,theta);
    Sp = inv(Cp);
    Ex = 1/Sp(1,1);
end


