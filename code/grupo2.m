% inicializacoes
x = [1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 2.75, 3, 3.25, 3.5, 3.75, 4];
y = [0.757, 0.578, 0.223, -0.247, -0.311, -0.536, 0.191, 0.761, 0.877, 1.57, 2.58, 2.87, 3.9];
MSE = zeros(1, 1);
MSEmplus1 = zeros(1, 1);
SSE = zeros(1, 1);
gl = zeros(1, 1);
p = zeros(1, 1);
e = zeros(1, 1);
DivMSE = zeros(1, 1); % Guarda abs(MSE(m) / MSE(m + 1))
NumeroDePontos = 13;

% geracao do metodo para m entre 1 e 5
figure(1);
z = 0.5 : 0.001 : 4.5; % pois os pontos a aproximar estao em [0.5; 4.5]
plot(x, y, 'o');
hold on;
for m = 1 : 5
    [p, e] = polyfit(x, y, m);
    plot(z, polyval(p, z));
    % Escreve os coeficientes do polinomio aproximador escolhido
    if m == 2
        fprintf("Coeficientes para m = 2\n")
       disp(p) 
    end
    hold on;
    SSE(m) = e.normr ^ 2;
end
% elementos do grafico
ylim([-3 5])
xlim([0.5 4.5]) % pois os pontos a aproximar estao em [0.5; 4.5]
title('Pontos e funções aproximadoras m: 1-5');
xlabel('x');
ylabel('y');
legend('Pontos Tabela 1', 'm = 1', 'm = 2', 'm = 3', 'm = 4', 'm = 5', 'Location', 'southeast', 'NumColumns', 2);
grid;
hold off;

% geracao do metodo para m entre 6 e 11
figure(2);
plot(x, y, 'o');
hold on;
for m = 6 : 11
    [p, e] = polyfit(x, y, m);
    plot(z, polyval(p, z));
    hold on;
    SSE(m) = e.normr ^ 2;
end
% elementos do grafico
title('Pontos e funções aproximadoras m: 6-11');
ylim([-3 5])
xlim([0.5 4.5]) % pois os pontos a aproximar estao em [0.5; 4.5]
grid;
xlabel('x');
ylabel('y');
legend('Pontos Tabela 1', 'm = 6', 'm = 7', 'm = 8', 'm = 9', 'm = 10', 'm = 11', 'Location', 'southeast', 'NumColumns', 2);
hold off;

% calculo de vetor de MSE_m
for m = 1 : 11
    gl(m) = NumeroDePontos - (m + 1);
    MSE(m) = SSE(m) / gl(m);
end

% calculo de vetor de MSE_(m + 1)
for m = 1 : 10
    MSEmplus1(m) = MSE(m + 1);
end

% calculo de vetor de |MSE_m / MSE_(m + 1)|
for m = 1 : 10
    DivMSE(m) = abs(MSE(m) / MSE(m + 1));
end

DivMSE(11) = 0; % apenas para imprimir
fprintf("m \t SSE_m \t\t\t\t\t MSE_m \t\t\t\t\t MSE_m / MSE_(m+1)\n")

for i = 1 : 11
    fprintf("%d\t%+.15e\t%.15e\t%.15e\n", i, SSE(i), MSE(i), DivMSE(i));
end
