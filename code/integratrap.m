function [n, TN, dif1, dif2] = integratrap(f, alpha, beta, maxk)  
    if maxk < 1
        fprintf('maxk invalid')
    end 
    dif1 = zeros(1);
    dif2 = zeros(1, 1);
    TN = zeros(1);
    n = zeros(1);
    h = zeros(1);
    h = (beta - alpha) / 2;
    maxk = 2 ^ maxk;
    % soma do primeiro com o ultimo termo de f(xi)
    suminicial = (feval(f, alpha) + feval(f, beta)) / 2; 
    k = 2;
    i = 1;
    while k <= maxk
        integral = suminicial;
        h = (beta - alpha) / k;
        % soma de todos os f(xi), exceto para o primeiro e para o ultimo
        % termo de xi
        for q = 1 : (k - 1)
             x = alpha + q * h; % calcula xi
             integral = integral + feval(f, x); % adiciona f(xi)
        end
        % pelo metodo dos trapezios, o integral sera a soma de
        % [0.5 * (f(x0) + f(xn)) + (soma de todos os outros f(xi))] * h
        TN(i) = integral * h;
        % calculo de |T_(2n) - T_n|
        if k > 2
             dif1(i) = abs(TN(i) - TN(i - 1));
        end
        % calculo de |T_(2n) - T_n| / |T_(4n) - T_(2n)|
        if k > 4
            dif2(i) =  dif1(i - 1) / dif1(i);
        end
        n(i) = k;
        i = i + 1;
        k = 2 ^ i;
    end 
end 
