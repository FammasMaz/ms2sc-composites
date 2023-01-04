function [S, A, B, D]=elasBehav(Cm, stack, t)
    height = t*[-length(stack)/2:length(stack)/2];
    nbLayers = length(stack);
    A = zeros(3);
    B = zeros(3);
    D = zeros(3);
    for i=1:nbLayers
        A = A + (rigidCp(Cm, deg2rad(stack(i)))*(height(i+1)-(height(i))));
        B = B + (rigidCp(Cm, deg2rad(stack(i)))*((height(i+1))^2-((height(i)))^2)/2);
        D = D + (rigidCp(Cm, deg2rad(stack(i)))*((height(i+1))^3-((height(i)))^3)/3);
    end
    S = [A B
        B D];
end




    