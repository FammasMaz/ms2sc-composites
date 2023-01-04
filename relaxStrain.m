function [plyNum, ePrlx,curStack, nur, kir] = relaxStrain(Cm, stack, t,z, alpha1, alpha2, dT)
    if (z>(length(stack)*t/2)) || (z<(-length(stack)*t/2))
        error('>:  The height asked is out of the max height of the stacked')
    end
    rlxGenStrn=relaxGenStrn(Cm, stack, t, alpha1, alpha2, dT);
    nur = rlxGenStrn(1:length(stack)/2-1);
    kir = rlxGenStrn((length(stack)/2):end);
    ePrlx = nur + (kir*z)
    plyNum = (ceil(z/t))+(length(stack)/2)
    curStack = stack(plyNum)
end

