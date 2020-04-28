% Helikopter. Modele: ci¹g³y i dyskretny.
% Wyznaczenie K1 i K2 regulatora LQR

Ah = A;
Bh = B;
Ch = [0 0 1];
Dh = [0];

DC_Cont = ss(Ah,Bh,Ch,Dh);

% Wyznaczenie modelu dyskretnego dla zadanego T0
T0 = 0.001;	% [s]
DC_Dig = c2d(DC_Cont,T0,'zoh');
Ad = DC_Dig.a;
Bd = DC_Dig.b;
Cd = DC_Dig.c;
Dd = DC_Dig.d;

% deg = pi/180;
% 
% q1 = 1/((deg)^2);
% q2 = 1/((deg*10)^2);
% q3 = 1/(600^2);
% 
% QQ = [q1 0 0;
%       0 q2 0;
%       0 0 q3];
% RR = [10];

deg = pi/180;

q1 = 1/((deg)^2);
q2 = 1/((deg*10)^2);
q3 = 1/(600^2);
% q2 = 0;
% q3 = 0;

QQ = [q1 0 0;
      0 q2 0;
      0 0 q3];
RR = [10];

% Wyznaczenie parametrow ci¹g³ego regulatora LQR
[KK,SS,EE] = lqr(Ah,Bh,QQ,RR);
fGain = KK(1);
wGain = KK(2);
nGain = KK(3);

% Wyznaczenie parametrow dyskretnego regulatora LQR
[KKd,SSd,EEd] = dlqr(Ad,Bd,QQ,RR);
fGaind = KKd(1);
wGaind = KKd(2);
nGaind = KKd(3);