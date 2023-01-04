function [plyNum, Ep,curStack] = localStrains(nu,ki,z,t,stack)
    if (z>(length(stack)*t/2)) || (z<(-length(stack)*t/2))
        error('>:  The height asked is out of the max height of the stacked')
    end
    Ep = (nu+z*ki)';
    plyNum = (ceil(z/t))+(length(stack)/2)
    curStack = stack(plyNum)
end
