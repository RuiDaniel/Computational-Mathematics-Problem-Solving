function [root, fc, k, c, e] = bissecao(f, a, b, eps_abs, eps_step, iter_max)
   if nargin < 6
       iter_max = 1e3; end
   if nargin < 5
       eps_step = 1e-6; end
   if nargin < 4
       eps_abs = 1e-6; end
   root = [];
   k = 0;
   c = a;
   e = b - a;
   fa = feval(f, a);
   fc = fa;
   fb = feval(f, b);
   if ( fa * fb < 0 )
      while abs(b - a) >= eps_step
         k = k + 1;
         if k > iter_max
            disp('root not found with the desired accuracy')
            fprintf('Maximum number of iterations exceeded: %d\n', k)
            return
         end
         c(k) = (a + b) / 2;
         e(k) = (b - a) / 2;
         fc = feval(f, c(k));
         if abs(fc) < eps_abs
            break;
         elseif fa * fc < 0
            b = c(k);
            fb = fc;
         else
            a = c(k);
            fa = fc;
         end
      end
   else
      disp('The function must have opposite signs at the extreme points');
   end
   root = c(length(c));
