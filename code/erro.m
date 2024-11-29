% funcao que calcula teoricamente o numero minimo de subintervalos para atingir uma certa precisao
function [n] = erro (b, a, Maxddx, erroMax)
    dif = abs(((b - a) ^ 3 ) / 12);
    erron = dif / erroMax;
    n = sqrt(erron * Maxddx);

    % ultilizamos n - 0.5 para a função arredondar n para baixo, e somamos
    % 1 para conseguir majorar o n
    n = round(n - 0.5) + 1;
end