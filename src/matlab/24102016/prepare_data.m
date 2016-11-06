straight = dlmread('straight.csv');
sleft = dlmread('circleLeftBig.csv'); 
sright = dlmread('circleRightBig.csv');
left = dlmread('circleLeftSmall.csv');
right = dlmread('circleLeftSmall.csv');
straight = straight(1:end-1,:);
sleft = sleft(1:end-250,:);
sright = sright(1:end-1,:);
left = left(1:end-1,:);
right = right(1:end-1,:);
 c1  = left(681:3221,:);
 omega = 2*pi/(c1(end,1)-c1(1,1))*1000;
 v = 2*pi*250/(c1(end,1)-c1(1,1))*1000;test_set = c1([1:250:2500],:);

figure(1)
plot(straight(:,2),straight(:,3));
grid on
xlabel('x,mm')
ylabel('y,mm')
title('Straight movement')

figure(2)
plot(sleft(:,2),sleft(:,3));
grid on
xlabel('x,mm')
ylabel('y,mm')
title('Slight left movement')

figure(3)
plot(sright(:,2),sright(:,3));
grid on
xlabel('x,mm')
ylabel('y,mm')
title('Slight right movement')

figure(4)
plot(left(:,2),left(:,3));
grid on
xlabel('x,mm')
ylabel('y,mm')
title('Left movement')

figure(5)
plot(right(:,2),right(:,3));
grid on
xlabel('x,mm')
ylabel('y,mm')
title('Right movement')