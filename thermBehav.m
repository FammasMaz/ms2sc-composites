function [Nth, Mth]=thermBehav(Cm, stack, t, alpha1, alpha2, dT)
    height = t*[-length(stack)/2:length(stack)/2];
    nbLayers = length(stack);
    Nth = zeros(3,1);
    Mth = zeros(3,1);
    for i=1:nbLayers
        Nth = Nth + (sigTherm(Cm, deg2rad(stack(i)), alpha1, alpha2)*(height(i+1)-(height(i)))*dT);
        Mth = Mth + (sigTherm(Cm, deg2rad(stack(i)), alpha1, alpha2)*(height(i+1)^2-(height(i))^2)*dT/2);
    end
end




    