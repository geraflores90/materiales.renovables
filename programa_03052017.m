% IMPORTANTE
% Primero se debe importar la tabla de AM1.5 de excel.
% No se debe comenzar este programa con clear,clc
Eg = 2.5;
q = 1.602e-19;
lambda = 1.24/Eg;
sz = size(AM1);
mat = [];
matp = [];
for i = 1:sz(1)
    p = 5.03e18 * prod(AM1(i,:));
    matp = [matp;p];
end
for i = 1:sz(1)
    perro = AM1(i,:);
    if perro(1) <= lambda
        b = horzcat(AM1(i,1),matp(i));
        mat = [mat;b];
    end
end
bubu = trapz(mat(:,1),mat(:,2));
j = bubu * (q/10)
voc = (3/4) * Eg;
p = j * voc;
