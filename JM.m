function ret=JM(x)
% ret=[ 3, x(3)*sin(x(2)*x(3)), 0; 
%     -2*x(1), -162*(x(2)+0.1), cos(x(3));
%     -x(2)*exp(-x(1)*x(2)), -x(1)*exp(-x(1)*x(2)), 20];

ret=[ 1, -2*x(2);
      -2*x(1), 1];