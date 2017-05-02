% Grafica de ni vs T para Arseniuro de Galio (GaAs).
% Gerardo Flores Jeronimo.
% 02 de Mayo de 2017.
% https://ecee.colorado.edu/~bart/book/eband5.htm
clc, clear
k = 1.3806e-23; % J/K
h = 6.626e-34; % J-s
mo = 9.11e-31; % kg
me = 0.067*mo; % kg
mh = 0.45*mo; % kg
Eg_o = 1.519; % eV
alpha = 5.41e-4; % eV/K
beta = 204; % K
v_T = [];
v_ni = [];
v_Eg = [];

for T = 0:1000
    Eg = Eg_o - (alpha*T^2)/(T + beta); % eV
    q = 1.602e-19; % J/eV
    Nc = 2*(2*pi()*me*k*T/(h^2))^(3/2); % m-3
    Nv = 2*(2*pi()*mh*k*T/(h^2))^(3/2); % m-3
    ni = sqrt(Nc * Nv) * exp(-Eg*q/(2*k*T)); % m-3
    v_T = [v_T;T];
    v_ni = [v_ni;ni];
    v_Eg = [v_Eg;Eg];
end

tab = horzcat(v_T, v_ni);
plot(tab(:,1),tab(:,2),'-','markersize',2)
title('ni vs T (GaAs)')
xlabel('T(K)')
ylabel('ni (m-3)')
