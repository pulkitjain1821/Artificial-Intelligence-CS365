train_data = loadMNISTImages('train-images.idx3-ubyte');
test_data = loadMNISTImages('t10k-images.idx3-ubyte');
train_labels = loadMNISTLabels('train-labels.idx1-ubyte');
test_labels = loadMNISTLabels('t10k-labels.idx1-ubyte');
train_data = train_data'; 
test_data = test_data';
error = zeros(1,50);
xs = 1:50;
for i = 1:50
    classes = knnclassify(test_data,train_data,train_labels,i);
    result = classes - test_labels;
    error(i) = (10000-sum(result (:) == 0))/100;
end
figure_p1=figure;
plot(xs,error,'-*b');
xlabel('K');
ylabel('Percentage Error');
saveas(figure_p1,'knn.jpg');