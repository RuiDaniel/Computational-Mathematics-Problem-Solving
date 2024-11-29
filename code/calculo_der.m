% GNU/Octave

pkg load symbolic;
syms x;

% array com as funções dadas
f ={exp(5 - x) * sin(50 * (x - 5)), 1 / (2 + sin(x - 5)), exp(- x ^ 2 + 10 * x - 25)};

% calcula e imprime a segunda derivada de cada função
for i = 1 : 3
    fprintf('Função %d\n', i);
    d2f = function_handle(diff(diff(f{i})))
end