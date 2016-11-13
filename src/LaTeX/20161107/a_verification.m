%Current estimation of speeds
%slight left - l 100, 0.08
%slight right - r 100,-0.08
%left - ll 100,0.17
%right - rr 100,-0.17
%straight - s 100,0.0


close all
a = [1.40713612e-02   6.03395470e-02   0   5.69003880e-02   0   0];
%Left test
data = llnew;
control = [50,0.17];

all_predicted =[data(1,2:4)];

for i=2:length(data)
    all_predicted = [all_predicted; predict_pose(control,all_predicted(i-1,:),(data(i,1)-data(i-1,1))/1000,a,effll)];
end

figure(1)
hold on
plot(all_predicted(:,1),all_predicted(:,2),'g');
plot(data(:,2),data(:,3),'r');
plot(data(1,2),data(1,3),'*');
grid on
xlabel('x,mm')
ylabel('y,mm')
legend('Predicted','True')
title('Predicted movement vs real, Left')
axis equal
hold off


%Slight Left test
data = lnew;
control = [-100,0.08];
all_predicted =[data(1,2:4)];



for i=2:length(data)
    all_predicted = [all_predicted; predict_pose(control,all_predicted(i-1,:),(data(i,1)-data(i-1,1))/1000,a,effl)];
end

figure(2)
hold on
plot(all_predicted(:,1),all_predicted(:,2),'g');
plot(data(:,2),data(:,3),'r');
plot(data(1,2),data(1,3),'*');
grid on
xlabel('x,mm')
ylabel('y,mm')
legend('Predicted','True')
title('Predicted movement vs real, Slight left')
axis equal
hold off


%Slight right test
data = rnew;
control = [-100,-0.08];

all_predicted =[data(1,2:4)];
all_predicted(1,3) = all_predicted(1,3);


for i=2:length(data)
    all_predicted = [all_predicted; predict_pose(control,all_predicted(i-1,:),(data(i,1)-data(i-1,1))/1000,a,effr)];
end

figure(3)
hold on
plot(all_predicted(:,1),all_predicted(:,2),'g');
plot(data(:,2),data(:,3),'r');
plot(data(1,2),data(1,3),'*');
grid on
xlabel('x,mm')
ylabel('y,mm')
legend('Predicted','True')
title('Predicted movement vs real, Slight right')
axis equal
hold off

%Right test
data = rrnew;

control = [50,-0.17];

all_predicted =[data(1,2:4)];
all_predicted(1,3) = all_predicted(1,3)+0;


for i=2:length(data)
    all_predicted = [all_predicted; predict_pose(control,all_predicted(i-1,:),(data(i,1)-data(i-1,1))/1000,a,effrr)];
end

figure(4)
hold on
plot(all_predicted(:,1),all_predicted(:,2),'g');
plot(data(:,2),data(:,3),'r');
plot(data(1,2),data(1,3),'*');
grid on
xlabel('x,mm')
ylabel('y,mm')
legend('Predicted','True')
title('Predicted movement vs real, Right')
axis equal
hold off

%Straight test
data = snew;

control = [-100,0];

all_predicted =[data(1,2:4)];
all_predicted(1,3) = all_predicted(1,3)+0;

for i=2:length(data)
    all_predicted = [all_predicted; predict_pose(control,all_predicted(i-1,:),(data(i,1)-data(i-1,1))/1000,a,effs)];
end

figure(5)
hold on
plot(all_predicted(:,1),all_predicted(:,2),'g');
plot(data(:,2),data(:,3),'r');
plot(data(1,2),data(1,3),'*');
grid on
xlabel('x,mm')
ylabel('y,mm')
legend('Predicted','True')
title('Predicted movement vs real, Straight')
axis equal
hold off

%Multiple left
%Left test
data = rnew(1:10,:);
control = [-100,-0.08];

all_predicted = cell(1,20);
for j=1:20
    all_predicted{j} =[data(1,2:4)];
    for i=2:length(data)
        all_predicted{j} = [all_predicted{j}; predict_pose(control,all_predicted{j}(i-1,:),(data(i,1)-data(i-1,1))/1000,a,effr)];
    end
end
figure(6)
hold on
plot(data(:,2),data(:,3),'r');
plot(data(1,2),data(1,3),'*');
for j = 1:20
    plot(all_predicted{j}(:,1),all_predicted{j}(:,2),'g');
end


grid on
xlabel('x,mm')
ylabel('y,mm')
legend('Start','True','Predicted')
title('Predicted movement vs real, Slight right')
axis equal
hold off