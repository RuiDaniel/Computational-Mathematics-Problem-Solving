f = @(x) (x ^ 3 - x ^ 2 - x + 1);
z = zeros(2, 1);
fx = zeros(2, 1);

[z(1), fx(1), iter1] = newtonquasi(f, -0.2, 1e-5, 1e-2, 1000);
[z(2), fx(2), iter2] = newtonquasi(f, -0.3, 1e-5, 1e-2, 1000);
fprintf('x0 = -0.2\nNumber of iterations = %d\n', size(iter1, 2));
disp(iter1);
fprintf('x0 = -0.3\nNumber of iterations = %d\n', size(iter2, 2));
disp(iter2);