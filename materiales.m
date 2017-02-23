% Calcula la energia solar recibida en un dia a una latitud y dia 
% especifico.

clear
clc

phi=19; % Latitud
n=63; % Dia especifico del año
dia=[];
delta=[];
matN=[];
h=[];

for i=1:365 
    dia=[dia;i];
    op_delta=23.5*sind((360/365)*(284+i));
    delta=[delta;op_delta];
    op_N=(2/15)*acosd(-tand(phi)*tand(delta(i)));
    matN=[matN;op_N];
    op_h=asind(sind(delta(i))*sind(phi)+cosd(delta(i))*cosd(phi)*cosd(0));
    h=[h;op_h];
end

N=matN(n);
H=(1/4)*(N*60);
H=round(H);
matH=[H];
I=1000*sind(asind(sind(delta(n))*sind(phi)+cosd(delta(n))*cosd(phi)*cosd(H)));
matI=[I];
horas=12-(H*4/60);
mat_horas=[horas];

for i=1:364
    H=H-1;
    matH=[matH;H];
    I=1000*sind(asind(sind(delta(n))*sind(phi)+cosd(delta(n))*cosd(phi)*cosd(H)));
    matI=[matI;I];
    horas=12-(H*4/60);
    mat_horas=[mat_horas;horas];
end

graf=horzcat(mat_horas,matI);
valores=[]; % Grafica que almacenara los valores a integrar (valores del 
            % eje y superiores a cero.

for i=1:365
    if graf(i,2)>=0
        valor=graf(i,:);
        valores=[valores;valor];
    end        
end

valores;
plot(valores(:,1),valores(:,2),'o','markersize',4)
    
E=trapz(valores(:,1),valores(:,2)) 


    