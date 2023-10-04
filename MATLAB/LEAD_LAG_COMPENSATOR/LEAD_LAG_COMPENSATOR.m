% Compensador por Avanco
% Project G(s) = (1)/((s+1)(s+3)(s+10))
% ess = 0.02
% mf = 50 
% mg = 10 dB

clc; % Limpa o que estava antes na Command Window

%            Encontrar o Valor de Kc   

syms s T1 T2 Kc alfa beta % Declara Variaveis simbolicas
G = 1 / ((s+1)*(s+3)*(s+10)); % Planta
Gc = Kc*(((T1*s+1)*(T2*s+1))/((alfa*T1*s+1)*(beta*T2*s + 1))); % Ganho do compensador

erss = 0.02;
Kp = (1-erss)/erss % coeficiente de erro de posição estático
Kc = 30*Kp

num = 1;
den = conv([1 1], conv([1 3], [1, 10]));
sys1 = Kc * tf(num, den);
bode(sys1)
margin(sys1)

%w = logspace(0, 2, 500); % ajustar a faixa de frequência
%[mag, fase, w] = bode(sys1, w);
wcg = 6.58; % frequência de cruzamento de ganho -> Gm margin

fim = 50 + 5;
beta = (1 + sin(fim*pi/180))/(1 - sin(fim*pi/180))
alfa = 1/beta
w_z_at = wcg/10 % a frequência do zero do compensador por atraso de fase é escolhida uma década abaixo de wcg
w_p_at = w_z_at/beta

num_at = [1/w_z_at 1];
den_at = [1/w_p_at 1];
comp_at = tf(num_at, den_at) % parcela por atraso de fase

aten_max_at = 20*log10(1/beta) % atenuação máxima da parcela por
Kd=10^(-8.11/20)/6.58
w_z_av = 10^( aten_max_at /20)/Kd
w_p_av = 10^(0/20)/Kd

a=10^(8.11/20)
w_p_av1=wcg*a
w_z_av1=w_p_av1*alfa

num_av = [1/w_z_av 1];
den_av = [1/w_p_av 1];
comp_av = tf(num_av, den_av)

comp = series(comp_at, comp_av) 

figure
bode(comp, 'k') % Gráficos logarítmicos do compensador Fig.12.
title('Compensador em atraso-avanço')

sys_comp = series(sys1, comp) % sistema compensado

figure(3)
bode(sys_comp) % gráficos logarítmicos do sistema compensado
w = logspase(0, 2, 500); % ajustar a faixa de frequência
title('Sistema compensado')







