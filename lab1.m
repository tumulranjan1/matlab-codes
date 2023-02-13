clc
clear all
format rat
%% phase 1: Input Parameter
%c=[2 1]
A=[1 2; 1 1; 0 1];
B=[2000; 1500; 600];
c = [3 5];
%% phase 2: Plotting the graph
y1=0:1:max(B)
x11=(B(1)-A(1,1).*y1)./A(1,2)
x21=(B(2)-A(2,1).*y1)./A(2,2)
x31=(B(3)-A(3,1).*y1)./A(3,2)
x11=max(0,x11)
x21=max(0,x21)
x31=max(0,x31)
plot(y1,x11,'r',y1,x21,'b',y1,x31,'g')
hold on;
title('x1 vs x2');
xlabel('Value of x1')
ylabel('Value of x2')
legend('x1+2x2=2000','x1+x2=1500','x2=600')

%%grid on
%% phase 3: find corner point with axes
cx1=find(y1==0); %points with x1 axis
c1=find(x11==0);  %points with x2 axis
Line1=[y1(:,[c1 cx1]); x11(:,[c1 cx1])]' ;
c2=find(x21==0);  %points with x2   axis
Line2=[y1(:,[c2 cx1]); x21(:,[c2 cx1])]' ;
c3=find(x31==0);  %points with x2   axis
Line3=[y1(:,[c3 cx1]); x31(:,[c3 cx1])]' ;
corpt=unique([Line1;Line2;Line3],'rows');
%Phase 4: To find the point of intersections
pt=[0;0];
for i=1:size(A,1)
    A1=A(i,:);
    B1=B(i,:);
    for j=i+1:size(A,1)
    A2=A(j,:);
    B2=B(j,:);
    A4=[A1; A2];
    B4=[B1; B2];
    X=inv(A4)*B4;
    pt=[pt X];
end
end
 ptt=pt'
% Phase5: Write all corner points
 allpt=[ptt;corpt];
X=unique(allpt,'rows')
%Phase 6:Find the feasible region of
%-x1+3x2<=10
%x1+x2<=6
%x1-x2<=2
%x1>=0,x2>=0
x1 = X(:,1);
x2 = X(:,2);
cons1 = x1+2.*x2-2000;
h1= find(cons1>0);
X(h1,:)= [];
%% Write 2st constraint here
x1 = X(:,1);
x2 = X(:,2);
cons2 = x1+x2-1500;
h2= find(cons2>0);
X(h2,:)= [];
%% Write 3st constraint here
x1 = X(:,1);
x2 = X(:,2);
cons3 = x2-600;
h3= find(cons3>0);
X(h3,:)= [];
points=X;
patch(points(:,1), points(:,2), 'red');
hold off;
%Phase 7:To find the objective function value of 
%Max z=3x1+5x2
 for i=1:size(X,1)
     fn(i,:)=(sum(X(i,:).*c))
 end
 ver_fns=[X fn]
     
 [optval, optposition]=max(fn)