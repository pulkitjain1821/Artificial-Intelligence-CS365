options.verbose=0;

[data,labels]=loadDigits(3000,'train','C:/Users/Pulkit/Documents/MATLAB',[1 7]);
D = L2_distance(data,data,1);
[Y, R, E] = Isomap(data,[1 1350 2540 302  413 556 787 876 1000],labels, D, 'k', 3,'1_7euc.jpg',[1 7],options);

[data,labels]=loadDigits(3000,'train','C:/Users/Pulkit/Documents/MATLAB',[4 9]);
D = L2_distance(data,data,1);
[Y, R, E] = Isomap(data,[1 1350 2540 302  413 556 787 876 1000],labels, D, 'k', 3,'4_9euc.jpg',[4 9],options);

[data,labels]=loadDigits(3000,'train','C:/Users/Pulkit/Documents/MATLAB',[0 1 2 3 4 5 6 7 8 9]);
D = L2_distance(data,data,1);
[Y, R, E] = Isomap(data,[1 15 56 1350  453 2540  231 302 786 413 556 790 876 1000 2422 1800 1500 ],labels, D, 'k', 3,'alleuc.jpg',[0 1 2 3 4 5 6 7 8 9],options);


[data,labels]=loadDigits(3000,'train','C:/Users/Pulkit/Documents/MATLAB',[1 7]);
D = tangent_d(data,data,1);
[Y, R, E] = Isomap(data,[1 1350 2540 302  413 556 787 876 1000],labels, D, 'k', 3,'1_7tan.jpg',[1 7],options);

[data,labels]=loadDigits(3000,'train','C:/Users/Pulkit/Documents/MATLAB',[4 9]);
D = tangent_d(data,data,1);
[Y, R, E] = Isomap(data,[1 1350 2540 302  413 556 787 876 1000],labels, D, 'k', 3,'4_9tan.jpg',[4 9],options);

[data,labels]=loadDigits(3000,'train','C:/Users/Pulkit/Documents/MATLAB',[0 1 2 3 4 5 6 7 8 9]);
D = tangent_d(data,data,1);
[Y, R, E] = Isomap(data,[1 15 56 1350  453 2540  231 302 786 413 556 790 876 1000 2422 1800 1500 ],labels, D, 'k', 3,'alltan.jpg',[0 1 2 3 4 5 6 7 8 9],options);