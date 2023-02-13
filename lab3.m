clc
clear all
format short
%max = 2x1+3x2+4x3+7x4
%2x1+3x2-x3+4x4=8
%x1-2x2+6x3-7x4=-3
A=[2 3 -1 4; 1 -2 6 -7]
C=[2 3 4 7]
b=[8; -3]
n=size(A,2)
m=size(A,1)
if(n>m)
nCm=nchoosek(n,m)
pair=nchoosek(1:n,m)
sol=[]
for i=1:nCm
y=zeros(n,1)
x=A(:,pair(i,:))\b
if all(x>=0 & x~=inf & x~=-inf)
y(pair(i,:))=x
sol=[sol, y]
end
end
else
error('nCm does not exists')
end
Z=C*sol
[Zmax, Zindex]=max(Z)
bfs=sol(:,Zindex)
optimal_value=[bfs' Zmax]
optimal_bfs=array2table(optimal_value)
optimal_bfs.Properties.VariableNames(1:size(optimal_bfs,2))={'x_1','x_2','x_3','x_4','Z'}