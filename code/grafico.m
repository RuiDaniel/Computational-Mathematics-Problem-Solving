w = @(r) 1.5 .* exp(- 1 .* r) .* (1 .* sin(2 .* r) + cos(2 .* r));
f = @(r) w(r) - 0.1;
i = 0 : 0.01 : 6;

plot(i, w(i), 'b', i, f(i), 'r', i, 0 .* i, 'g');
title('Funções w(r) e f(r)')
xlabel('x');
ylabel('y');
legend('w(r)', 'f(r)', 'x = 0');
grid;