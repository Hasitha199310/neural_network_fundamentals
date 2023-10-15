clear all;
close all;

%Inital vectors
p1 = [-1 -1 1 1 -1 1 1 -1 1 -1 1 -1 -1 1 1 -1 -1 -1 1 1]';
p6 = [1 1 1 1 1 -1 1 1 1 -1 1 1 1 -1 -1 1 1 -1 -1 1]';
p11 = [-1 -1 -1 -1 1 -1 -1 1 1 1 1 1  1 -1 -1 1 -1 -1 -1 -1]';
p16 = [1 1 1 1 1 -1 -1 1 1 -1 -1 1 1 -1 -1 1 1 1 1 1  ]';
p21 = [1 1 1 1 -1 -1 -1 1 -1 -1 -1 1 -1 -1 -1 1 1 1 1 1 ]';

%Visualization
% figure;
% dispapm(col2mtx(p1));
% figure;
% dispapm(col2mtx(p6)); 
% figure;
% dispapm(col2mtx(p11)); 
% figure;
% dispapm(col2mtx(p16)); 
% figure;
% dispapm(col2mtx(p21));

%toggling arrays for training set
toggling_array_A_Tr = [[nan,nan];[2,1];[3,2];[3,4];[4,4]];
toggling_array_E_Tr = [[nan,nan];[2,2];[4,2];[5,3];[4,3]];
toggling_array_I_Tr = [[nan,nan];[1,1];[4,2];[1,4];[4,3]];
toggling_array_O_Tr = [[nan,nan];[2,2];[4,2];[2,3];[4,3]];
toggling_array_U_Tr = [[nan,nan];[2,1];[4,1];[2,3];[4,3]];

%toggling arrays for test set 1
toggling_array_A1 = [[nan,nan];[4,1];[5,3];[2,4];[1,2]];
toggling_array_E1 = [[nan,nan];[2,4];[5,2];[4,3];[1,3]];
toggling_array_I1 = [[nan,nan];[4,4];[2,4];[2,2];[3,4]];
toggling_array_O1 = [[nan,nan];[1,3];[3,2];[5,4];[3,3]];
toggling_array_U1 = [[nan,nan];[5,3];[3,4];[1,4];[5,4]];

%toggling arrays for test set 2
toggling_array_A2 = [[nan,nan];[3,2];[1,3];[3,3];[2,1]];
toggling_array_E2 = [[nan,nan];[3,2];[3,3];[5,4];[1,2]];
toggling_array_I2 = [[nan,nan];[1,3];[2,2];[4,3];[1,4]];
toggling_array_O2 = [[nan,nan];[4,3];[4,3];[5,1];[2,4]];
toggling_array_U2 = [[nan,nan];[3,3];[2,2];[2,1];[1,3]];

%toggling arrays for test set 3
toggling_array_A3 = [[nan,nan];[5,2];[3,3];[1,3];[5,1]];
toggling_array_E3 = [[nan,nan];[3,4];[1,4];[5,2];[1,3]];
toggling_array_I3 = [[nan,nan];[1,1];[1,2];[2,4];[2,1]];
toggling_array_O3 = [[nan,nan];[1,2];[4,2];[3,3];[1,4]];
toggling_array_U3 = [[nan,nan];[3,2];[5,2];[5,4];[4,2]];


%Toggling array for Training set
toggling_array_Tr = [toggling_array_A_Tr; toggling_array_E_Tr; toggling_array_I_Tr; toggling_array_O_Tr; toggling_array_U_Tr] ;

%Toggling arrays for test sets
toggling_array_1 = [toggling_array_A1; toggling_array_E1; toggling_array_I1; toggling_array_O1; toggling_array_U1] ;
toggling_array_2 = [toggling_array_A2; toggling_array_E2; toggling_array_I2; toggling_array_O2; toggling_array_U2] ;
toggling_array_3 = [toggling_array_A3; toggling_array_E3; toggling_array_I3; toggling_array_O3; toggling_array_U3] ;

% for j=1:length(toggling_array_A)
%      x = toggling_array_A(j,1);
%      y = toggling_array_A(j,2);
%      test_set_1(:,j) = toggle(p1,x,y);  
% end

initial_matrix = [repmat(p1,1,5),repmat(p6,1,5),repmat(p11,1,5),repmat(p16,1,5),repmat(p21,1,5)];

training_set = toggle_array(initial_matrix,toggling_array_Tr,zeros(20,25));
test_set_1 = toggle_array(initial_matrix,toggling_array_1,zeros(20,25));
test_set_2 = toggle_array(test_set_1,toggling_array_2,zeros(20,25));
test_set_3 = toggle_array(test_set_2,toggling_array_3,zeros(20,25));

%Visualization Training set
figure;
title("Training Set");
for k=1:length(training_set)
subplot(5,5,k);
pattern = training_set(:,k);
dispapm(col2mtx(pattern));
end

%Visualization test set 1
figure;
title("Test Set 1");
for k=1:length(test_set_1)
subplot(5,5,k);
pattern = test_set_1(:,k);
dispapm(col2mtx(pattern));
end

%Visualization test set 2
figure;
title("Test Set 2");
for k=1:length(test_set_2)
subplot(5,5,k);
pattern = test_set_2(:,k);
dispapm(col2mtx(pattern));
end

%Visualization test set 3
figure;
title("Test Set 3");
for k=1:length(test_set_3)
subplot(5,5,k);
pattern = test_set_3(:,k);
dispapm(col2mtx(pattern));
end

save("training_set.mat","training_set");
save("test_set_1.mat","test_set_1");
save("test_set_2.mat","test_set_2");
save("test_set_3.mat","test_set_3");
