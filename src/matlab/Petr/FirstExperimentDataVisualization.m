data = dlmread('Data_updated.prn');

xc = 0.5*(data(:,1)+data(:,3));
yc = 0.5*(data(:,2)+data(:,4));
d = 70;
phi = acos((data(:,4)-data(:,2))./sqrt((data(:,4)-data(:,2)).^2+(data(:,1)-data(:,3)).^2));
phi(80:120) = phi(80:120)-pi;
phi(204-42:end) = phi(204-42:end)-pi;

%Overall experiment review

xc = xc - d*cos(phi);
yc = yc + d*sin(phi);

position_straight = [xc(1:40) yc(1:40)];
position_slight_left = [xc(41:79) yc(41:79)];
position_slight_left = position_slight_left([1:31,34:end],:);
position_slight_right = [xc(80:120) yc(80:120)];
position_slight_right = position_slight_right(2:end,:)
position_left = [xc(121:161) yc(121:161)];
position_right = [xc(162:end) yc(162:end)];

phi_straight = phi(1:40);
phi_slight_left = phi(41:79);
phi_slight_right = phi(80:120);
phi_left = phi(121:161);
phi_right = phi(162:end);

figure(1)
plot(yc,xc,'ro')
grid on
xlabel('y, mm')
ylabel('x, mm')
title('Overall distribution of robots poses')
legend('Robot center')

figure(2)
plot(rad2deg(phi),'ro')
grid on
xlabel('Run number')
ylabel('Phi, deg')
title('Overall distribution of robots heading direction')
legend('Robot heading angle in degrees')

% % Forward experiment
% figure(3)
% plot(position_straight(:,1),position_straight(:,2),'ro',mean(yc(1:20)),mean(xc(1:20)),'g*')
% mean(yc(1:20))
% mean(xc(1:20))
% var(yc(1:20))
% var(xc(1:20))
% grid on
% xlabel('y, mm')
% ylabel('x, mm')
% title('Distribution of robots poses after straight movement')
% legend('Robot center','Mean value')
% 
% figure(4)
% histogram(rad2deg(phi_straight))
% grid on
% ylabel('Run number')
% xlabel('Phi, deg')
% title('Distribution of robots heading directions after straight movement')
% legend('Robot heading angle in degrees')


% % Slightly left experiment
% figure(5)
% plot(yc(21:40),xc(21:40),'ro',mean(yc(21:40)),mean(xc(21:40)),'g*')
% mean(yc(21:40))
% mean(xc(21:40))
% var(yc(21:40))
% var(xc(21:40))
% grid on
% xlabel('y, mm')
% ylabel('x, mm')
% title('Distribution of robots poses after slightly left movement')
% legend('Robot center','Mean value')
% 
% figure(6)
% histogram(rad2deg(phi(21:40)))
% grid on
% ylabel('Run number')
% xlabel('Phi, deg')
% title('Distribution of robots heading directions after slightly left movement')
% legend('Robot heading angle in degrees')
% 
% % Slightly right experiment
% figure(7)
% plot(yc(41:60),xc(41:60),'ro',mean(yc(41:60)),mean(xc(41:60)),'g*')
% mean(yc(41:60))
% mean(xc(41:60))
% var(yc(41:60))
% var(xc(41:60))
% grid on
% xlabel('y, mm')
% ylabel('x, mm')
% title('Distribution of robots poses after slightly right movement')
% legend('Robot center','Mean value')
% 
% figure(8)
% histogram(rad2deg(phi(41:60)))
% grid on
% ylabel('Run number')
% xlabel('Phi, deg')
% title('Distribution of robots heading directions after slightly right movement')
% legend('Robot heading angle in degrees')
% 
% % Left experiment
% figure(9)
% plot(yc(61:81),xc(61:81),'ro',mean(yc(61:81)),mean(xc(61:81)),'g*')
% mean(yc(61:81))
% mean(xc(61:81))
% var(yc(61:81))
% var(xc(61:81))
% grid on
% xlabel('y, mm')
% ylabel('x, mm')
% title('Distribution of robots poses after left movement')
% legend('Robot center','Mean value')
% 
% figure(10)
% histogram(rad2deg(phi(61:81)))
% grid on
% ylabel('Run number')
% xlabel('Phi, deg')
% title('Distribution of robots heading directions after left movement')
% legend('Robot heading angle in degrees')
% 
% % Right experiment
% figure(11)
% plot(yc(82:end),xc(82:end),'ro',mean(yc(82:end)),mean(xc(82:end)),'g*')
% mean(yc(82:end))
% mean(xc(82:end))
% var(yc(82:end))
% var(xc(82:end))
% grid on
% xlabel('y, mm')
% ylabel('x, mm')
% title('Distribution of robots poses after right movement')
% legend('Robot center','Mean value')
% 
% figure(12)
% histogram(rad2deg(phi(82:end)))
% grid on
% ylabel('Run number')
% xlabel('Phi, deg')
% title('Distribution of robots heading directions after right movement')
% legend('Robot heading angle in degrees')

