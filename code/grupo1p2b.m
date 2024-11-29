f = @(x) (1.5 * exp(- x) * (sin(2 * x)+ cos(2 * x)) - 0.01);

% gerador de grafico de f de modo a observar o intervalo a que a primeira
% raiz de f pertence
t = 0 : 0.01 : 2;
x1 = zeros(1, 1);
for i = 1 : length(t)
    x1(i) = 1.5 * exp(- t(i)) * (sin(2 * t(i))+ cos(2 * t(i))) - 0.01 ;
end
figure(1)
plot(t, x1, '-', t, t * 0, '--')
title('Gráfico de f(x)')
legend('f(x)', 'x = 0', 'Location', 'northeast');
grid;
xlabel('x')
ylabel('f(x)')

% graficamente observamos que a raiz está entre 0.5 e 1.4 (é aproximadamente 1.17)
[root, fc, k, c, errobissecao] = bissecao(f, 0.5, 1.4, 1e-18, 1e-15, 1000);
[z, fx, iter] = newtonquasi(f, 1.0, 1e-4, 1e-12, 10000);
% calculo dos modulos dos erros em cada iterada, comparativamente ao valor
% exato calculado no metodo da bissecao
e = iter;
e = abs(root - e);
% inicializacoes
x = zeros(1, 1); 
y = zeros(1, 1);
% elementos de x: xi = ln |e(i)|
for i = 1 : length(e) - 1
    x(i) = log (e(i));
end
% elementos de y: yi = ln |e(i + 1)|
for i = 2 : length(e)
    y(i - 1) = log (e(i));
end

% geracao de grafico com reta de ajuste aos pontos (x, y)
[p, s] = polyfit(x, y, 1);
figure(2)
plot(x, y, 'o', x, polyval(p, x), '--');
title('Reta de ajuste de ln|e(k)| em funcao de ln|e(k+1)|')
xlabel('x = ln |e(k)|')
ylabel('y = ln |e(k+1)|')
legend('Pontos (x, y)', 'y(x)', 'Location', 'southeast');
grid;
fprintf("Coeficientes da reta de ajuste obtida\n")
for i = 1 : length(p)
    fprintf("%+.15e\n", p(i));
end
% calculo dos coeficientes assimptoticos de convergencia ao longo das
% iteradas
coeficienteassimptotico = zeros(1, 1);
for i = 1 : length(x) - 1
    coeficienteassimptotico(i) = e(i + 1) / e(i);
end
fprintf("\nCoeficientes Assimptoticos de Convergencia ao longo das iteradas:\n")
for i = 1 : length(coeficienteassimptotico)
    fprintf("%+.15e\n", coeficienteassimptotico(i));
end
% se elementos deste vetor tenderem para um numero real, ordem de
% convergencia é 1 e o coeficiente é o valor deste limite

% calculo do coeficiente assimptotico de convergencia teoricamente
delt = 10 ^ (- 4);
fzd = 1.5 * exp(- 1 * (root + delt)) * (sin(2 * (root + delt)) + cos(2 * (root + delt))) - 0.01;
fz = 1.5 * exp(- root) * (sin(2 * root) + cos(2 * root)) - 0.01;
dfz = - 1.5 * exp(- root) * (sin(2 * root) + cos(2 * root)) + 1.5 * exp(- root) * (2 * cos(2 * root) - 2 * sin(2 * root));
cof = abs(1 - (delt * dfz) / (fzd - fz));

% determinacao da ordem de convergencia
ordem = zeros(1);
zz = y - x;
for i = 2 : length(zz) - 1
    ordem(i) = zz(i) / zz(i - 1);
end

fprintf("\nn \t ln|e_n| \t\t\t\t ln|e_{n+1}| \t\t   ln|e_{n+1}| - ln|e_n| \t (ln|e_{n+1}| - ln|e_n|) / (ln|e_n| - ln|e_{n - 1}|)\n")

for i = 1 : length(zz) - 1
    fprintf("%d\t%+.15e\t%.15e\t%.15e\t%.15e\n", i, x(i), y(i), zz(i), ordem(i));
end