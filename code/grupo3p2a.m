% numero de pontos utilizados para produzir o grafico
N = 5000;
ints = [linspace(5, 11, N); linspace(5, 2 * pi + 5, N); linspace(5, 7, N)];
f_1 = @(x) exp(5 - x) .* sin(50 .* (x - 5));
f_2 = @(x) 1 ./ (2 + sin(x - 5));
f_3 = @(x) exp(- x .^ 2 + 10 .* x - 25);
f = {f_1, f_2, f_3}; % array das funções para iterar

for n = 1 : 3
    subplot(1, 3, n);
    range = ints(n, :);
    plot(range, f{n}(range));
    xlabel('x');
    ylabel('y');
    xlim([range(1) range(end)]);
    title(sprintf("Função %d", n));
    grid;
end