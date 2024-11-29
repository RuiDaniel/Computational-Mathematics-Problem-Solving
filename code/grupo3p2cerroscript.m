% segundas derivadas das funcoes calculadas anteriormente em calculo_der.m
ddf1 = @(x) - 2499 * exp (5 - x) .* sin (50 * x - 250) - 100 * exp (5 - x) .* cos (50 * x - 250);
ddf2 = @(x) sin (x - 5) ./ (sin (x - 5) + 2) .^ 2 + 2 * cos (x - 5) .^ 2 ./ (sin (x - 5) + 2) .^ 3;
ddf3 = @(x) (10 - 2 * x) .^ 2 .* exp (- x .^ 2 + 10 * x - 25) - 2 * exp (- x .^ 2 + 10 * x - 25);

% calculo do maximo do modulo das segundas derivadas nos respetivos
% intervalos de integracao
N = 1000;
limits = [5 11; 5 2 * pi + 5; 5 7];
ints = [linspace(5, 11, N); linspace(5, 2 * pi + 5, N); linspace(5, 7, N)];
f = {ddf1, ddf2, ddf3};
Maxddx = zeros(3, 1);
num_intervalos = zeros(3, 1);

% calculo do numero minimo de subintervalos para atingir a precisao pedida 
for n = 1 : 3
    range = ints(n, :);
    Maxddx(n) = max(abs(f{n}(range)));
    num_intervalos(n) = erro (limits(n, 2), limits(n, 1), Maxddx(n), 10 ^ (- 6));
end

fprintf("Número mínimo de intervalos:\n")
disp(num_intervalos)