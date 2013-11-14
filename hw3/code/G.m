[data,names] = loadImageData('hw3_dataset/1_2d_3k','png');                  %load 3000 (images resized as [100 100]
obj1 = imread('imageObs2.png');                                             %load the obstacle image
obj1 = imresize(obj1,[100 100]);

%identify pixels corresponding to the obstacle.
%we are assuming the knowledge that only obstacle has green colour and has only green colour green.
%searching for all green pixels in the [100 100] image.

pixels=[];                                                                  
for i = 1:100
	for j = 1:100
		if(obj1(i,j,1)==0 & obj1(i,j,2)==255 & obj1(i,j,3)==0)
			pixels=[pixels [i;j]];
		end
	end
end

%find all images that intersect with object
%pixels corresponding to obstacle should not be acquired by out bot
%an image has bot intersecting with obstacle if pixels corresponding to
%obstacle are non black.
inter = [];
for img = 1: size(data,2)
	for i = 1:size(pixels,2)
		if(	~(data(pixels(1,i)+(pixels(2,i)-1)*100,img)==0)||~(data(pixels(1,i)+(pixels(2,i)-1)*100 + 10000,img)==0)||~(data(pixels(1,i)+(pixels(2,i)-1)*100 + 20000,img)==0))
			inter = [inter img];
			break;
		end
	end
end			


data = double(data);
D = L2_distance(data,data,1);

options.dims=[1 2 3];
options.overlay=0;

[Y,R,E,Path] = Isomap_g(D,data,inter,'k',7,options); 