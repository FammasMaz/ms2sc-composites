function Cp=rigidCp(Cm, theta)
    c = cos(theta);
    s = sin(theta);
    T = [c^2 s^2 c*s
        s^2 c^2 -c*s
        -2*c*s 2*c*s c^2-s^2];
    Cp = T'*Cm*T;
end
