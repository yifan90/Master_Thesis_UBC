theta=74*pi/180.0d0;
V = [ 1 cos(theta)/sin(theta); 0 1];
[n1,n2] = meshgrid(-3:3);
P = V * [ n1(:) n2(:) ].';
plot(P(1,:),P(2,:),'bo','MarkerFaceColor','b');
voronoi(P(1,:),P(2,:));