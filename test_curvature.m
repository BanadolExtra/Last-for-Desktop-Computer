% circle example
% r=sort(rand(15,1))*2*pi;
%  Vertices=[sin(r) cos(r)]*10;
%  Lines=[(1:size(Vertices,1))' (2:size(Vertices,1)+1)']; Lines(end,2)=1;
%  k=LineCurvature2D(Vertices,Lines);
% 
%  figure,  hold on;
%  N=LineNormals2D(Vertices,Lines);
%  k=k*100;
%  plot([Vertices(:,1) Vertices(:,1)+k.*N(:,1)]',[Vertices(:,2) Vertices(:,2)+k.*N(:,2)]','g');
%  plot([Vertices(Lines(:,1),1) Vertices(Lines(:,2),1)]',[Vertices(Lines(:,1),2) Vertices(Lines(:,2),2)]','b');
%  plot(sin(0:0.01:2*pi)*10,cos(0:0.01:2*pi)*10,'r.');
%  axis equal;
%% hand example
load('testdata');
 k=LineCurvature2D(Vertices,Lines);

 figure,  hold on;
 N=LineNormals2D(Vertices,Lines);
 k=k*100;
 plot([Vertices(:,1) Vertices(:,1)+k.*N(:,1)]',[Vertices(:,2) Vertices(:,2)+k.*N(:,2)]','g');
 %plot([Vertices(Lines(:,1),1) Vertices(Lines(:,2),1)]',[Vertices(Lines(:,1),2) Vertices(Lines(:,2),2)]','b');
 plot(Vertices(:,1),Vertices(:,2),'r.');
 axis equal;