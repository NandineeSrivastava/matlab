% ROC curve
a = [ 1 1 1 1 0 0 1 1 ];
p = [ 1 0 1 1 0 0 1 1 ];
tp = 0;
tn = 0;
fp = 0;
fn = 0;
for i = 1:length(a)
    if a(i)== 1 && p(i) == 1
    tp = tp + 1
    elseif a(i) == 0 && p(i) == 0
    fp = fp + 1
    elseif a(i) == 1 && p(i) == 0
    tn = tn + 1
    elseif a(i) == 0 && p(i) == 1
    fn = fn + 1
    end
end
confmatrix = [ tp, tn ; fp, fn ];
disp ('Confusion Matrix : ');
disp (confmatrix);
[X, Y, T, AUC] = perfcurve(a, p, 1);
figure;
plot(X,Y);
xlabel('Flase positive rate');
ylabel('True posotive rate');
title(['ROC curve (AUC = ' num2str(AUC)']);
precision = tp / (tp + fp);
accuracy = (tp * tn) / (tp + tn + fp + fn);
recall = tp / (tp + fn);
f1 = 2 * precision * recall / (precision + recall);
fprintf('Precision: %.2F/n', precision);
fprintf('Accuracy: %.2F/n', accuracy);
fprintf('Recall: %.2F/n', recall);
fprintf('F1 score: %.2F/n', f1);