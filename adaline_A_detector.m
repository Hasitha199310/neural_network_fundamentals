clear all;     %Start fresh with empty workspace
close all;

% SET PARAMETERS:
alpha = [0.05,0.005,0.0005];
num_epochs = 100;

%Loading the training set
training_set = load("training_set.mat").training_set;

%Initialization
initial_weights = zeros(1,20);
initial_bias = 0;

%Targets
targets_a = [1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];

%training
W_matrix = repmat(zeros(20,1),1,3);
b_matrix = repmat(zeros(1),1,3);
LastMSE_matrix = repmat(zeros(1),1,3);
MSE_matrix = repmat(zeros(num_epochs,1),1,3);

for i=1:length(alpha)
    alpha_new = alpha(i);
    [Wlast, blast, MSE, LastMSE] = adaline_train(initial_weights, initial_bias, alpha_new, training_set , targets_a,num_epochs);
    W_matrix(:,i) = Wlast;
    b_matrix(:,i) = blast;
    LastMSE_matrix(:,i) = LastMSE;
    MSE_matrix(:,i) = MSE;
end
% Display the "Learning Curve"
subplot(3,1,1);
plot(MSE_matrix(:,1),"red")
grid on;
xlabel('Epochs'); ylabel('MSE per epoch');
tstr = sprintf('Learning Curve with alpha of %f ', alpha(1));
title(tstr); axis([0, num_epochs 0 inf]) %ensure min y is 0


subplot(3,1,2);
plot(MSE_matrix(:,2),"green")
grid on;
xlabel('Epochs'); ylabel('MSE per epoch');
tstr = sprintf('Learning Curve with alpha of %f ', alpha(2));
title(tstr); axis([0, num_epochs 0 inf]) %ensure min y is 0

subplot(3,1,3);
plot(MSE_matrix(:,3),"blue")
grid on;
xlabel('Epochs'); ylabel('MSE per epoch');
tstr = sprintf('Learning Curve with alpha of %f ', alpha(3));
title(tstr); axis([0, num_epochs 0 inf]) %ensure min y is 0


%testing
test_set1 = load("test_set_1.mat").test_set_1;
test_set2 = load("test_set_2.mat").test_set_2;
test_set3 = load("test_set_3.mat").test_set_3;

% Moving forward with the weights of alpha = 0.005
Wlast_a = W_matrix(:,2)';
blast_a = b_matrix(:,2)';
predictions_a1 = adaline_predictions(test_set1,Wlast_a,blast_a);
error_a1 = targets_a-predictions_a1;

predictions_a2 = perceptron_predictions(test_set2,Wlast_a,blast_a);
error_a2 = targets_a-predictions_a2;

predictions_a3 = perceptron_predictions(test_set3,Wlast_a,blast_a);
error_a3 = targets_a-predictions_a3;



