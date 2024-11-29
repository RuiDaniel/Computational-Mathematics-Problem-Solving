% inicializacoes
z = zeros (1, 14);
num_iter = zeros (1, 14);
erros = zeros (1, 14);

% valor do zero de f calculado na alinea 2b) pelo metodo da bissecao
zero = 1.170498853760944;

f = @(r) 1.5 .* exp(- 1 .* r) .* (1 .* sin(2 .* r) + cos(2 .* r)) - 0.01;
 
% Para delta de 10 ^ -1 a 10 ^ (- 14)  fazer o calculo da raiz de f e determinar o
% erro

for i = 1 : 14 
    delta = 10 ^ (- i);
    [z(i), fx, iter] = newtonquasi(f, 1.0, delta, 1e-5, 1000);
    num_iter(i) = length(iter);
    erros(i) = abs(z(i) - zero);
end

fprintf("Numero de iteradas ao longo dos diferentes delta:\n")
disp(num_iter)

fprintf("Modulo do erro ao longo dos diferentes delta:\n")
disp(erros)