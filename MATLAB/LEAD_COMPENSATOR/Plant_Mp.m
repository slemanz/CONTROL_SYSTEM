% LEAD COMPENSATOR
% Project G(s) = (4)/(s(s+2))
% mf = 50°
% mg = 10 dB
% Kv = 25

clc;
syms s T Kc alfa
G = 4 / (s*(s+2));
Gc = Kc*((T*s+1)/(alfa*T*s+1));
Kv = limit(s*G*Gc,s,0);
 
Kc = 25/2; % do better

s = tf('s');
G = 4 / (s*(s+2));

Planta = Kc*G

bode(Planta)
margin(Planta) %O valor da fase de sys 1
Planta_cl = feedback(Planta, 1)

figure
step(Planta_cl)
Fim = 50 - 16.1 + 5 % defasagem igual a 38.9
a = sin((Fim * pi)/180) % convert to rad/s factor alpha
alfa = (1-a)/(1+a)
b = 20*log10(1/sqrt(alfa)) % eq 6 apostila
wcg = 10.1;
T = 1/(wcg*sqrt(alfa)) % eq 3 apostila

Gc = Kc*(s*T+1)/(s*alfa*T + 1)

Planta_comp = Gc * G
figure
bode(Planta_comp)
margin(Planta_comp)
Ess_esp = 1/Kv
Planta_c2 = feedback(Planta_comp, 1)
figure
step(Planta_c2)

Planta_ramp = Planta_c2/s
figure
step(Planta_ramp)
[y,t] = step(Planta_ramp);
ess = t(length(t)) - y(length(y))

figure
bode(Gc)



