
inputs_tr = load("PPTATE.mat").PP;

figure;
title("Test Set 3");
for k=1:length(inputs_tr)
subplot(5,5,k);
pattern = test_set_1(:,k);
dispapm(col2mtx(pattern));
end