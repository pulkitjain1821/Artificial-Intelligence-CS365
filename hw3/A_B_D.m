[data,names] = loadImageData('hw3_dataset/1_2d_3k','png');
data = double(data);
D = L2_distance(data,data,1);
options.overlay=0;
options.dim=2;
[Y,R,E]= Isomap_a_b_d(data,D,'k',7,options);