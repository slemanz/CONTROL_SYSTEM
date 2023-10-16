%% ESPECIFICACOES
%  PLANTA: G(s) = 10/(s(s+15))
%  mf  = 45 deg
%  mg  = 12 dB
%  ess = 0,01

close all
clc

%% Planta (tipo 1)
nump = 10;
denp = [1 15 0];
G = tf(nump,denp)

%% Determinar a constante Kc do controlador com base no
% desempenho em estado estacionario. Como Kv=100, . Portanto
% o controlador deve contribuir com ganho CC de 150. Assim
Kc = 150;

%% Determinar de quanto precisa ser o aumento de fase para
% termos MF aprox 50 graus ao final. 
% Primeiro fazemos o diagrama de Bode do sistema nao compensado
figure(1)
bode(G)
margin(G)
grid

% usando o Kc somente, acharemos uma primeira estimativa da 
% frequencia de cruzamento:
% planta com compensacao de ganho 
GKc=tf(Kc*nump,denp);

% Diagrama de Bode do sistema compensado com ganho
figure(2)
bode(GKc)
margin(GKc)
grid

% a margem de fase eh aproximadamente 21,9 graus e a frequencia em torno de 37,3 rad/s. 
% Portanto faltam 23,1 graus para 45. Como a frequencia de cruzamente sera
% sempre maior (pela acao do controlador), somaremos uma folga, de 5 graus.
% Assim, desejamos que no ponto de maxima elevacao de fase, o controlador
% contribua 28,1 graus: phi_m = 45 - 21,9 + 5 = 28,1
phi_m=28.1;

%% Determinar a posicao "relativa" do polo em relacao ao zero
% A razao entre as frequencias do zero e do polo, que eh igual a
% "a", que eh dado por 
a=(1-sin(phi_m*pi/180))/(1+sin(phi_m*pi/180))

%% Determinar a "localizacao" da resposta em frequencia do
% controlador, ou seja, encontrar wm, frequencia em que ocorre phi_m. Nessa
% frequencia o ganho do controlador eh (em dB): 
Gc_wm=20*log10(Kc/sqrt(a)) 

%% Para que wm seja a nova frequencia de cruzamento, o ganho
% de malha nessa fequencia deve ser 1. Ou seja, o ganho da planta (sem Kc obviamente) 
% deve ser o inverso do ganho do controlador nessa frequencia. Em dB, o ganho da
% planta deve ser o reciproco (negativo) do ganho do controlador. Mas ja
% calculamos o ganho do controlador em wm: Gc_wm, portanto podemos obter a
% frequencia graficamente:
% Olhar no primeiro grafico!!!

% note que em torno da fequencia 48,7 rad/s a planta tem ganho -Gc_wm (em dB).
% Portanto -> valor encontrado em 28.3 dB
wm=48.7; 

%% Determinar o valor de T
T=1/(wm*sqrt(a)) 

%% Estah projetado o controlador:
numc=Kc*[T 1];
denc=[a*T 1];
C=tf(numc,denc)


%% Compensando o sistema e plotando o bode
% sistema compensado
CG=C*G;

figure(3)
bode(CG)
margin(CG)
grid

%% Dominio do tempo
% resposta do sistema controlado (em malha fechada) ao degrau unitario 
Y_R=feedback(G,1); % sem controlador!!!
Y_R2=feedback(CG,1);  % com controlador

figure(4)
step(Y_R,'b',Y_R2,'r');
legend('Sem Compensador','Com Compensador');

figure(5)
step(Y_R2, 'r');

%% Erro em estado estacionario
t=0:0.01:2;
Yg_R=feedback(G,1);
yg=lsim(Yg_R,t,t);

figure(6)
y=lsim(Y_R2,t,t);
figure(6)
plot(t,t,'k',t,y,t,yg);
xlabel('tempo')
ess=t(end)-y(end)