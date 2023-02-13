clc
clear all
format short
%max Z= 3x1+5x2
%x1+2x2<=2000
%x1+x2<= 1500
%x2>=600
%Phase I: To input Parameters
C=[3, 5];  %cost coefficients
A=[1 2; 1 1; 0 1]; %coefficient Matrix
b=[ 2000; 1500; 600]; %Right hand side
%Phase II: To identify <= or >= type constraints
% 0 for <= sign
% 1 for >= sign
Ineqsign=[0,0,1]
%Phase III: To introduce slack and surplus variables
s=eye(size(A,1))  %eye(2) means identity matrix of order 2
index=find(Ineqsign>0)
s(index,:)=-s(index,:)
%Phase IV: To write the standard form
objfn=array2table(A) %To representing objective function
objfn.Properties.VariableNames(1:size(C,2))={'x_1','x_2'}
mat=[A s b]
cons=array2table(mat);
cons.Properties.VariableNames(1:size(mat,2))={'x_1','x_2','s1','s2','s3','b'}