% Utilizando com pequenas alterações a função  bissecao.m da biblioteca de programas
% da professora Isabel Reis dos Santos:
% (Código em MatLab: Ficheiro grupo1p2a.m)
w = @(r) 1.5 .* exp(- 1 .* r) .* (1 .* sin(2 .* r) + cos(2 .* r));
f = @(r) w(r) - 0.1;

% É chamada a função bissecção.m, dado na biblioteca de funções.
% Apenas se faz uma chamada pois só será necessário calcular uma raiz
% devido aos parâmetros dados: observamos graficamente que para r > 0
% só existe um único r tal que f(r) = 0
[z, f_z, n, iters, e_iters] = bissecao(f, 0.5, 1.5, 1e-20, 1e-15);
fprintf("Intervalo = [%d; %.15f]\n|e_n| = %e\n", 0, z, e_iters(end))