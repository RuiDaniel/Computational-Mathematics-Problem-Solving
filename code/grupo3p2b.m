I = [5 11; 5 2 * pi + 5; 5 7]; % matriz com os valores a, b de cada função
f_1 = @(x) exp(5 - x) .* sin(50 .* (x - 5));
f_2 = @(x) 1 ./ (2 + sin(x - 5));
f_3 = @(x) exp(- x .^ 2 + 10 .* x - 25);
f = {f_1, f_2, f_3};

for i = 1 : 3
    r = I(i, :); % linha i da matriz I
    [n, t, dif1, dif2] = integratrap(f{i}, r(1), r(2), 19);
    fprintf("função %s\n", func2str(f{i}));
    fprintf("\t  n\t T_(n) \t\t\t    |(T_(n) - T_(n/2)| \t\t |(T_(n/2) - T_(n/4)| / |(T_(n) - T_(n/2)| \n")
    for j = 1 : length(n)
        fprintf(" %6d\t%+.15e\t%.15e\t%.15e\n", n(j), t(j), dif1(j), dif2(j));
    end
    fprintf("\n");
end