%% Prosecc data from raw dataset
%Authors P.Lukin,  E. Ovchinnikova

data = dlmread('Data_updated.prn');


xc = 0.5*(data(:,1)+data(:,3));
yc = 0.5*(data(:,2)+data(:,4));
% figure(1)
% plot(xc,yc,'ro'); grid on

d = 70;
phi = acos((-data(:,4)+data(:,2))./sqrt((-data(:,4)+data(:,2)).^2+(data(:,1)-data(:,3)).^2));
phi(1:40) = -phi(1:40);
phi(81:120) = -phi(81:120);
phi(121:161) = pi-phi(121:161);
phi(162:end) = -(pi-phi(162:end));
% phi(41:79) = -phi(41:79); phi(121:161) = -phi(121:161);
%Overall experiment review

xc = xc - d*cos(phi);
yc = yc - d*sin(phi);

% figure(2)
% plot(xc,yc,'ro'); grid on

position_straight = [xc(1:40) yc(1:40)];
position_slight_left = [xc(41:80) yc(41:80)];
position_slight_left = position_slight_left([1,3:31,34:end],:);

position_slight_right = [xc(81:120) yc(81:120)];
position_slight_right = position_slight_right(2:end,:);
position_slight_right = position_slight_right([1:3,5:7,9:end],:);

position_left = [xc(121:161) yc(121:161)];
position_left = position_left([1:23,27:end],:);

position_right = [xc(162:end) yc(162:end)];
position_right = position_right([2:35,37:end],:);


phi_straight = phi(1:40);

phi_slight_left = phi(41:80);
phi_slight_left = phi_slight_left([1,3:31,34:end],:);

phi_slight_right = phi(81:120);
phi_slight_right = phi_slight_right(2:end,:);
phi_slight_right = phi_slight_right([1:3,5:7,9:end]);

phi_left = phi(121:161);
phi_left = phi_left([1:23,27:end]);

phi_right = phi(162:end);
phi_right = phi_right([2:35,37:end]);