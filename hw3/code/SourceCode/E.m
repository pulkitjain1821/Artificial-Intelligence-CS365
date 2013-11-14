[data,names] = loadImageData('hw3_dataset/1_2d_3k','png');                  %load 3000 (images resized as [100 100]
obj1 = imread('imageObs1.png');                                             %load the obstacle image
obj1 = imresize(obj1,[100 100]);

data = double(data);
D = L2_distance(data,data,1);
options.dims=2;
options.overlay=0;
inter = [];                                                                 %using same code as part f . there are no intersecting points this time
[Y,R,E] = Isomap_f(D,data,inter,'k',7,options); 