% LEAD COMPENSATOR
% Project G(s) = (4)/(s(s+2))
% mf = 50°
% mg = 10 dB
% Kv = 25

clc;
syms s T Kc alfa
G = 4 / (s*(s+2));
Gc = Kc*((T*s+1)/(alfa*T*s+1));
Kv = limit(s*G*Gc,s,0)
 
Kv = 25/2 % do better