%{
[data,names] = loadImageData('hw3_dataset/1_2d_3k','png');
data = double(data);
D = L2_distance(data,data,1);
options.dims = 1:15;
[Y,R,E] = Isomap_a_b_c_d(D,'k',7,options);
twod = 2;
threed = 3;



 
 
 %%%%%%%%%%%%%%%%%%%%% PART D %%%%%%%%%%%%%%%%%%
 plot3(Y.coords{threed}(1,:),Y.coords{threed}(2,:),Y.coords{threed}(3,:),'ro');
 box on;
 view (45,45);
 title('3-D Embeddings')
 %}
 %%%%%%%%%%%%%%%%%%%% PART C %%%%%%%%%%%%%%%%%%%

 %%%%% showing variation of theta1 %%%%%%%%
 figure;
 hold on;
 plot(Y.coords{twod}(1,:), Y.coords{twod}(2,:), 'yo') 
 Angles = importdata('angles.txt');
 rand = [103 410 482 783 974 989 1039 1110 1831 2048 2068  2429 2450 2495 2725 2941];
 for q = 1:size(rand,2)
	    plot(Y.coords{twod}(1,rand(q)), Y.coords{twod}(2,rand(q)), 'bo') 
		str = ['(', num2str(Angles(rand(q),1)), ', ', num2str(Angles(rand(q),2)), ')'];
		text(Y.coords{twod}(1,rand(q)),Y.coords{twod}(2,rand(q)),str, 'Color', 'k','FontSize', 10);
 end
 title('Variation of Theta1 and Theta2');
 hold off;
 
 %%%%% showing variation of theta2 %%%%%
 figure;
 hold on;
 plot(Y.coords{twod}(1,:), Y.coords{twod}(2,:), 'yo') 
 %Angles = importdata('angles.txt');
 rand2 = [50 142 422 526 605 723 956 1113 1206 1229 1289 1291 1469 1671 1709 1779 1848 1893 2063 2353 2398];
 for q = 1:size(rand2,2)
	    plot(Y.coords{twod}(1,rand2(q)), Y.coords{twod}(2,rand2(q)), 'bo') 
		str = ['(', num2str(Angles(rand2(q),1)), ', ', num2str(Angles(rand2(q),2)), ')'];
		text(Y.coords{twod}(1,rand2(q)),Y.coords{twod}(2,rand2(q)),str, 'Color', 'k','FontSize', 10);
 end
 title('Variation of Theta1 and Theta2');
 hold off;

%{
 %%%%%%%%%%%%%%%%%%%% PART B %%%%%%%%%%%%%%%%%%%%%%

            
         figure;
         hold on;
         plot(Y.coords{twod}(1,:), Y.coords{twod}(2,:), 'ro');
        
         %{
         random = [];
         for i=1:size(data,2)
            if(rem(i,195)==0)
                random = [random i];
             end
         end
         %}
         random = [1 230 10 500 1000 1500 200 2000 2500 2600];
         
         scale1 = range(Y.coords{twod}(1,:))/800;
         scale2 = range(Y.coords{twod}(2,:))/600;
                
         for i = 1:size(random,2)
            newImg=reshape(data(:,random(i)),100,100,3);
            %newImg2 = imresize(newImg,[30 30]);
            newImg = newImg(21:80,21:80,:);
            %{
            for i = 1:size(newImg,1)
                for j = 1:size(newImg,2)
                    if ( newImg(i,j,1)==0 && newImg(i,j,2)==0 && newImg(i,j,3)==0)
                            newImg(i,j,1)=255;
                            newImg(i,j,2)=255;
                            newImg(i,j,3)=255;
                    end
                end
            end
            %}
            %newImg2 = imresize(newImg,[30 30]);
            %
            %newImg = uint8(newImg);
            newImg = newImg/255;
            xc = Y.coords{twod}(1,random(i));
            yc = Y.coords{twod}(2,random(i));
            imagesc([xc xc-50*scale1],[yc yc-50*scale2], newImg);
            plot(xc,yc,'bo')
            title('2-D Embeddings');
         end 
        hold off;
        

 %%%%%%%%%%%%%%%%%%%%%%%% PART A %%%%%%%%%%%%%%%%%%%
 figure;
 hold on
 plot(1:15, R, 'bo'); 
 plot(1:15, R, 'b-'); 
 ylabel('Residual Variance'); 
 hold off
 xlabel('Isomap dimensionality');
 title('');
 %}