I = [5 11; 5 2 * pi + 5; 5 7]; % matriz com os valores a, b de cada função
f_1 = @(x) exp(5 - x) .* sin(50 .* (x - 5));
f_2 = @(x) 1 ./ (2 + sin(x - 5));
f_3 = @(x) exp(- x .^ 2 + 10 .* x - 25);
f = {f_1, f_2, f_3};
dif3 = zeros(19, 1);

for i = 1 : 3
    r = I(i, :); % linha i da matriz I
    [n, t, dif1, dif2] = integratrap(f{i}, r(1), r(2), 19);
    dif3 = dif1 / 3;
    fprintf("função %s\n", func2str(f{i}));
    
    fprintf("\t  n\t |(T_(n) - T_(n/2)| \t\t |e_(n)| \n")
    for j = 1 : length(n)
        fprintf(" %6d\t%.15e\t%.15e\n", n(j), dif1(j), dif3(j));
    end
    fprintf("\n");
end