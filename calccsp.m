function [a,b,c,d]=calccsp(x,y,leftd,rightd)
% Routine to CALculate a Clamped Cubic SPline

% Initialize
n=length(x); h=diff(x);
matA=zeros(n,n); matA(1,1)=2*h(1); matA(1,2)=h(1);
matA(n,n)=2*h(n-1); matA(n,n-1)=h(n-1); rhs=zeros(n,1);
rhs(1)=3*(y(2)-y(1))/h(1)-3*leftd;
rhs(n)=3*rightd-3*(y(n)-y(n-1))/h(n-1);

% Form matrix and rhs
for i=2:n-1
    matA(i,i-1)=h(i-1); matA(i,i)=2*(h(i-1)+h(i));
    matA(i,i+1)=h(i);
    rhs(i)=3*(y(i+1)-y(i))/h(i)-3*(y(i)-y(i-1))/h(i-1);
end

% Solve the system
sol=matA\rhs;

% Form the output
a=y(1:n-1); b=zeros(1,n-1); c=sol(1:n-1)'; d=zeros(1,n-1);
for i=1:n-1
    b(i)=(y(i+1)-y(i))/h(i)-h(i)*(sol(i+1)+2*sol(i))/3;
    d(i)=(sol(i+1)-sol(i))/(3*h(i));
end
