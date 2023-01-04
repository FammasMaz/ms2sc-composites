%% Variables
stack = [0, 45, 90, -45, -45, 90, 45, 0];
stack = [0, 90, 90, 0];
%stack = [0, 90];
alpha1 = 0;
alpha2 = 30e-6;
thickness = 0.125e-3;
dT = -160;
nu = [0.01 0 0]
z = linspace(-length(stack)*thickness/2+0.0000000001,length(stack)*thickness/2-0.0000000001, 100)
ki = [0 0 0]

%% Question 1
Cm = rigidCm(E1, E2, nu12, G12)
%% Question 2
tEps = thermEps(alpha1, alpha2, dT)
%% Question 3
Cp = rigidCp(Cm, theta)
%% Question 4
plotEx(Cm)
%% Question 5-a
Cm = rigidCm(100e9, 10e9, 0.3, 5e9);
figure
plotEx(Cm)
%legend('Material 1')
hold on

%% Question 5-b
Cm = rigidCm(50e9, 50e9, 0.3, 5e9);
plotEx(Cm)
%legend('Material 2')

%% Question 5-c
Cm = rigidCm(50e9, 50e9, 0.3, 50e9/(2*(1+0.3)));
plotEx(Cm)
legend('Material 1', 'Material 2','Material 3')
title('Elastic Modulus E_x as a function of angle (\theta)')
hold off
 
%% Question 6
[S, A, B, D] = elasBehav(Cm, stack, thickness)

%% Question 7
[Nth, Mth] = thermBehav(Cm, stack, thickness, alpha1, alpha2, dT)

%% Question 8
[curStack, sigP,eP,sigM,eM] = localBeh(Cm,dT,thickness,nu,ki,z,stack,alpha1,alpha2)

%% Question 9
[S, A, B, D] = elasBehav(Cm, stack, thickness)

%% Question 10
[N, M]=genBehav(Cm, stack, thickness, nu, ki, alpha1, alpha2, dT);
[plyNum, sigP,eP,sigM,eM] = localBeh(Cm,dT,thickness,nu,ki,z,stack,alpha1,alpha2);
figure
plot(z, sigM)
title('Local Stresses in Material Basis')
xlabel('Height (m)')
ylabel('Local Stress (Pa)')
legend('\sigma_{11}', '\sigma_{22}','\sigma_{12}')
figure
plot(z, eM)
title('Local Strains in Material Basis')
xlabel('Height (m)')
ylabel('Local Strain')
legend('\epsilon_{11}', '\epsilon_{22}','\epsilon_{12}')

%% Question 11
rlxGenStrn=relaxGenStrn(Cm, stack, thickness, alpha1, alpha2, dT)
[plyNum, ePrlx,curStack, nur, kir]=relaxStrain(Cm, stack, thickness, 3*thickness/2, alpha1, alpha2, dT)
[plyNumr, sigPr, ePr, sigMr, eMr] = relaxBeh(Cm,dT,thickness,z,stack,alpha1,alpha2)

figure
plot(z, sigMr)
title('Relaxed Stresses in Material Basis')
xlabel('Height (m)')
ylabel('Relaxed Stress (Pa)')
legend('\sigma_{11}', '\sigma_{22}','\sigma_{12}')
figure
plot(z, eMr)
title('Relaxed Strains in Material Basis')
xlabel('Height (m)')
ylabel('Relaxed Strain')
legend('\epsilon_{11}', '\epsilon_{22}','\epsilon_{12}')

