function [z, fx, iter] = newtonquasi(f, x0, Delta, TolX, MaxIter)
  % caso o utilizador insira menos de 4 argumentos, funcao retorna sem resolver o problema
  if (nargin < 4 || nargin > 5) 
      fprintf('Incorret input arguments\n');
      return;
  end
  % caso utilizador insira 4 argumentos, definimos que o numero maximo de iteradas seria 1000
  if nargin < 5 
      MaxIter = 1000;
  end
  TolFun = eps;
  iter = zeros(1, 1); % inicializacao do vetor de iteradas
  iter(1) = x0; % aproximacao inicial
  fx = feval(f, x0); % fx = f(x(k))
  for k = 1 : MaxIter
    dx = - (fx * Delta) / (feval(f, iter(k) + Delta) - fx);
    iter(k + 1) = iter(k) + dx; % aplicacao do metodo para calculo de x(k + 1)
    fx = feval(f, iter(k + 1));
    criterio = (iter(k + 1) - iter(k)) / iter(k + 1); % criterio de paragem
    if abs(fx) < TolFun || abs(criterio) < TolX, break; end
  end
  z = iter(k + 1); % aproximacao final
  if k == MaxIter
    fprintf('The best in %d iterations\n', MaxIter)
  end
end