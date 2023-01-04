function [plyNum, sigP,eP,sigM,eM] = relaxBeh(Cm,dT,t,z,stack,alpha1,alpha2)
    
    eP = zeros(3, length(z));
    sigM = zeros(3, length(z));
    sigP = zeros(3, length(z));
    eM = zeros(3, length(z));
    plyNum = zeros(size(z));


    for i=1:length(z)
        if (z(i)>(length(stack)*t/2)) || (z(i)<(-length(stack)*t/2))
            error('>:  The height asked is out of the max height of the stacked');
        end
        [PLYNUM, EP,curStack,~,~] = relaxStrain(Cm, stack, t, z(i), alpha1, alpha2, dT)
        plyNum(i) = PLYNUM;
        eP(:,i) = EP;
        Cp = rigidCp(Cm,deg2rad(curStack))
        sigUth=sigTherm(Cm, deg2rad(curStack), alpha1, alpha2)
        SIGP = Cp*EP - sigUth*dT
        sigP(:,i) = SIGP;
        c = cos(deg2rad(curStack));
        s = sin(deg2rad(curStack));
        T = [c^2 s^2 c*s
            s^2 c^2 -c*s
            -2*c*s 2*c*s c^2-s^2];
        SIGM = T'\SIGP;
        sigM(:,i) = SIGM;
        EM = T*EP;
        eM(:,i) = EM;
    end

end

