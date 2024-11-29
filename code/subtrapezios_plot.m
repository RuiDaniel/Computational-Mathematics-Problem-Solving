I = [5 11; 5 2 * pi + 5; 5 7];
f_1 = @(x) exp(5 - x) .* sin(50 .* (x - 5));
f_2 = @(x) 1 ./ (2 + sin(x - 5));
f_3 = @(x) exp(- x .^ 2 + 10 .* x - 25);
figure(1);
clf;
set(gcf, 'Position', [0 0 1000 1000]);
func = f_1;         % mudar aqui a função a desenhar
interv = I(1, :);   % mudar aqui nº da linha do intervalo da função a desenhar
r_linha = linspace(interv(1), interv(2), 500);
for i = 3 : 6
    h = (interv(2) - interv(1)) / (2 ^ i);
    % o round(interv(2)) + 1 é usado devido ao ponto final do segundo
    % intervalo ser um valor irracional
    xi = interv(1) : h : round(interv(2)) + 1;    
    yi = feval(func, xi);
    subplot(2, 2, i - 2);
    hold on;
    title(sprintf("nº subintervalos = %d", 2 ^ i)); 
    for j = 1 : length(xi) - 1
        axis on;
        xlim(interv);
        % criar os pontos para cada trapézio e encher o "interior" da função
        pts_x = [ xi(j) xi(j) xi(j + 1) xi(j + 1) ];
        pts_y = [ 0 yi(j) yi(j + 1) 0];
        plot(pts_x, pts_y, 'k');
        fill(pts_x, pts_y, 'y', 'FaceAlpha', 0.7, 'EdgeAlpha', 0.3, 'FaceColor', '#D4CCDC');
    end
    % plot da função escolhida
    plot(r_linha, func(r_linha), 'r');
    xlabel('x');
    ylabel('f(x)');
    grid;
    hold off;
end