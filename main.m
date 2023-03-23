[stlname,stlpath,stlyes]=uigetfile('*.stl');
[x0, y0, z0, varargout] = stlread(stlname);
xnum1=size(x0,1);
xnum2=size(x0,2);
bluff_datax = reshape(x0,xnum2*xnum1,1);
bluff_datay = reshape(y0,xnum2*xnum1,1);
bluff_dataz = reshape(z0,xnum2*xnum1,1);
points = [bluff_datax,bluff_datay,bluff_dataz];
[normals,curvature] = findPointNormals(points,[],[0,0,0],true);
sizecurvature=size(curvature,1);
c=isnan(curvature);
t=c2t(c,curvature,sizecurvature);
judge=atan(t);
judge=judge';
test = [points,judge];
test = unique(test,'rows');
uniquex = test(:,1);
uniquey = test(:,2);
uniquez = test(:,3);
uniquejudge = test(:,4);
hold on
%plot3(uniquex,uniquey,uniquez,'r.')
x_lin=linspace(min(uniquex),max(uniquex),100);
y_lin=linspace(min(uniquey),max(uniquey),100);
[X,Y]=meshgrid(x_lin,y_lin);
T=griddata(uniquex,uniquey,uniquejudge,X,Y,'linear');
Z=griddata(uniquex,uniquey,uniquez,X,Y,'linear');
hold on
hidden off
grid off

surfc(X,Y,Z,T);
shading interp

