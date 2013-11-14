[data,names] = loadImageData('hw3_dataset/1_2d_3k','png');
obj1 = imread('imageObs1.png');
obj1 = imresize(obj1,[100 100]);
pixels=[];
for i = 1:100
	for j = 1:100
		if(obj1(i,j,1)==0 & obj1(i,j,2)==255 & obj1(i,j,3)==0)
			pixels=[pixels [i;j]];
		end
	end
end

%newobj = zeros(100,100,3);
%for k = 1:size(pixels,2)
%	newobj(pixels(1,k),pixels(2,k),1)=0;
%	newobj(pixels(1,k),pixels(2,k),2)=255;
%	newobj(pixels(1,k),pixels(2,k),3)=0;
%end
%imshow(newobj)	

for img = size(data,2):-1:1
    disp('zin loop')
	for i = 1:size(pixels,2)
		if(	~(data(pixels(1,i)+(pixels(2,i)-1)*100,img)==0)|~(data(pixels(1,i)+(pixels(2,i)-1)*100 + 10000,img)==0)|~(data(pixels(1,i)+(pixels(2,i)-1)*100 + 20000,img)==0))
			data(:,img)=[];
			break;
		end
	end
end			
data = double(data);

disp('Here')
D = L2_distance(data,data,1);
disp('There')
[Y,R,E]= Isomap(D,'k',7);