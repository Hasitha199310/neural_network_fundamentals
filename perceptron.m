clear all;
close all;


%Loading the training set
training_set = load("training_set.mat").training_set;

%Initialization
initial_weights = zeros(1,20);
initial_bias = 0;

%Targets
targets_a = [1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
targets_e = [-1,-1,-1,-1,-1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];


%Training- A classifier
[Wlast_a, blast_a, nzelast_a] = perceptrn(initial_weights,initial_bias,training_set,targets_a,5);

%Training- E classifier
[Wlast_e, blast_e, nzelast_e] = perceptrn(initial_weights,initial_bias,training_set,targets_e,10);

%[Wlast_, blast_, nzelast_,weight_matrix,bias_matrix,error_matrix] = perceptrn_edited(initial_weights,initial_bias,inputs,targets,20);


%testing
test_set1 = load("test_set_1.mat").test_set_1;
test_set2 = load("test_set_2.mat").test_set_2;
test_set3 = load("test_set_3.mat").test_set_3;

predictions_a1 = perceptron_predictions(test_set1,Wlast_a,blast_a);
error_a1 = targets_a-predictions_a1;

predictions_a2 = perceptron_predictions(test_set2,Wlast_a,blast_a);
error_a2 = targets_a-predictions_a2;

predictions_a3 = perceptron_predictions(test_set3,Wlast_a,blast_a);
error_a3 = targets_a-predictions_a3;

%predictions_E-classifier
predictions_e1 = perceptron_predictions(test_set1,Wlast_e,blast_e);
error_e1 = targets_e-predictions_e1;

predictions_e2 = perceptron_predictions(test_set2,Wlast_e,blast_e);
error_e2 = targets_e-predictions_e2;

predictions_e3 = perceptron_predictions(test_set3,Wlast_e,blast_e);
error_e3 = targets_e-predictions_e3;

