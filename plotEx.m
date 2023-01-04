function plotEx(Cm)
    
    angle = 0:deg2rad(1):deg2rad(359);
    Ex = zeros(size(angle));
    for i=1:length(angle)
        Ex(i) = elasEx(Cm, angle(i));
    end
    polarplot(angle, Ex)
end