%Current estimation of speeds
%slight left - l 100, 0.08
%slight right - r 100,-0.08
%left - ll 100,0.17
%right - rr 100,-0.17
%straight - s 100,0.0
clear a
close all
a = [0 0 0 0 0 0];
%Left test
data = llnew;
clear E
start_param = [1, 1, 0, 0];
control = [50,0.17];

all_predicted =[data(1,2:4)];

E = @(p) effSpeedErr(p, data,control);

effll = fminsearch(E, start_param)
speedll = [effll(1)*control(1)+effll(3),effll(2)*control(2)+effll(4)]

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
clear E
start_param = [1, 1, 0, 0];
control = [-100,0.08];

%data(:,1) = data(:,1)+pi;
all_predicted =[data(1,2:4)];
all_predicted(1,3) = all_predicted(1,3)+0;


E = @(p) effSpeedErr(p, data,control);

effl = fminsearch(E, start_param)
speedl = [effl(1)*control(1)+effl(3),effl(2)*control(2)+effl(4)]

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
%data(:,1) = data(:,1)+pi;
clear E
start_param = [1, 1, 0, 0];
control = [-100,-0.08];

all_predicted =[data(1,2:4)];
all_predicted(1,3) = all_predicted(1,3);

E = @(p) effSpeedErr(p, data,control);

effr = fminsearch(E, start_param)
speedr = [effr(1)*control(1)+effr(3),effr(2)*control(2)+effr(4)]

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
%data(:,1) = data(:,1)+pi;
clear E
start_param = [1, 1, 0, 0];
control = [50,-0.17];

all_predicted =[data(1,2:4)];
all_predicted(1,3) = all_predicted(1,3)+0;

E = @(p) effSpeedErr(p, data,control);

effrr = fminsearch(E, start_param)
speedrr = [effrr(1)*control(1)+effrr(3),effrr(2)*control(2)+effrr(4)]

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
clear E
start_param = [1, 1, 0, 0];
control = [-100,0];

all_predicted =[data(1,2:4)];
all_predicted(1,3) = all_predicted(1,3)+0;

E = @(p) effSpeedErr(p, data,control);

effs = fminsearch(E, start_param)
speeds = [effs(1)*control(1)+effs(3),effs(2)*control(2)+effs(4)]

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