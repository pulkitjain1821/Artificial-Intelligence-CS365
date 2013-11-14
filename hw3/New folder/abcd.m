%[ data, names,files ] = loadImageData( 'hw3_dataset/1_2d_3k', 'png');
d = L2_distance(data,data);
options.dims=1:10;
[Y, R, E] = Isomapc(d,files, 'k', 7, options,data,'hw3_dataset/1_2d_3k'); 
figure;
hold on;
plot(Y.coords{twod}(1,:), Y.coords{twod}(2,:), 'ko'); 
for q=1:3000
str = num2str(A(q,:));
text(Y.coords{twod}(1,q),Y.coords{twod}(2,q),str, 'Color', 'r');
end
hold off;
twod=3;
figure;
hold on;
plot3(Y.coords{twod}(1,:), Y.coords{twod}(2,:), Y.coords{twod}(3,:), 'ko'); 
view(45,45);
hold off;