function [err ] = step2error( param )

k1 = param(1);
k2 = param(2);
b1 = param(3);
b2 = param(4);
left = dlmread('circleLeftBig.csv');
c1  = left(681:3221,:);
data = c1(1:250:2500,:);

err = 0;
v = k1*2*pi*1200/(data(end,1)-data(1,1))+b1;

omega = k2*2*pi/(data(end,1)-data(1,1))+b2;
u = [v, omega];
all_predicted = [];

for i=1:9
    dt = data(i+1,1)-data(i,1);
    pose = data(i,2:4);
    
    predicted = predict_pose(u,pose,dt);
    all_predicted = [all_predicted; predicted];
    true_next = data(i+1,2:4);
    err = err + norm(predicted - true_next);
end
% figure(1)
% plot(all_predicted(:,1),all_predicted(:,2));
% grid on
% 
% 
% figure(2)
% plot(data(2:end,2),data(2:end,3));
% grid on
% err
end

