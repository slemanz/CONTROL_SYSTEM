% Kv = 5s^-1
% mf = 40°
%mg = 10 db

clc % limpa a command window

syms s Kc T beta % declara variaveis simbolicas

G = 1/(s*(s+1)*(0.5*s + 1)); % planta
Gc = Kc*(T*s+1)/(beta*T*s+1); % Compensador

Kv = limit(s*G*Gc,s,0) == 5; % calcula o limite quando s tende a 0 (ganho de velocidade)
Kc = solve (Kv , Kc); % Rosolver a equacao
Kc = eval (Kc) % Transformar o valor simbolico para double

s = tf('s'); % passa variavel para trabalhar em estado de frequencia
G = 1/(s*(s+1)*(0.5*s + 1)); % planta em estado de frequencia

G1 = Kc*G
bode(G1)
margin(G1) % achar as margens e as frequencias de cruzamento

fim = -180+40+5; % fim = -135 -> conforme o grafico plotado -> 180 + mf + (5 a 12)

% em -135° -> 0.556 rad/s phase(deg)
wcg = 0.556;
wz = 0.1*wcg; % freq de canto (dever ser uma oitava ou uma decada)

T = 1/wz; % 17.9856
% em 0.556 rad/s -> magnitude = 17.5

% atenuacao
b = 17.5; % b = 20*log(beta) = 17.5
beta = 10^(b/20);

Gc = Kc*(T*s + 1)/(beta*T*s + 1) % planta compensada

sys_comp = Gc*G % sistema compensado
figure % nova figura
bode(sys_comp)
margin(sys_comp)

sys_cl = feedback(sys_comp, 1); % sistema em malha fechada
figure
step(sys_cl)
t=0:0.01:150;

sys_ramp = sys_cl/s
[y,t] = step(sys_ramp, t);

ess = t(length(t))-y(length(y))

Kv = 5;
erro_especificado = 1/Kv %1/5 = 0.2





