options.verbose=0;

[data,labels]=loadDigits(1000,'train','C:/Users/Pulkit/Documents/MATLAB',[1 7]);
D = L2_distance(data,data,1);
[Y, R, E] = Isomap(data,[1 350 240 302  413 556 787 876 1000],labels, D, 'k', 7,'1_7euc.jpg',[1 7],options);
