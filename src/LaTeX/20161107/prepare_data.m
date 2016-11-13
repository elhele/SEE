close all;
% straight = dlmread('straight.csv');
% sleft = dlmread('circleLeftBig.csv'); 
% sright = dlmread('circleRightBig.csv');
%  left = dlmread('circleLeftSmall.csv');
% right = dlmread('circleLeftSmall.csv');
% straight = straight(1:end-1,:);
% sleft = sleft(1:end-250,:);
% sright = sright(1:end-1,:);
%  left = left(1:end-1,:);
% right = right(1:end-1,:);
% c1  = left(681:3221,:);
%  omega = 2*pi/(c1(end,1)-c1(1,1))*1000;
%  v = 2*pi*250/(c1(end,1)-c1(1,1))*1000;test_set = c1([1:250:2500],:);
% data = importdata('straight2.log',' ');
% predata = [];
% predata(:,1:3) = data.data(:,1:3);
% predata(:,4) = str2num(cell2mat(data.textdata(:,1)));



% figure(1)
% plot(predata(:,1),predata(:,2));
% grid on
% xlabel('x,mm')
% ylabel('y,mm')
% title('Straight movement')

lnew = l(300:5:1000,:);
rnew = r(1:5:1000,:);
rrnew = rr(1:5:1000,:);
llnew = ll(1:5:1000,:);

snew = s(1:2:240,:);

% omega = [-2*pi/(l(915,1)-l(1,1)) 2*pi/(r(625,1)-r(1,1)) ...
%     2*pi/(rr(291,1)-rr(1,1)) 2*pi/(ll(430,1)-ll(1,1)),0]*1000;
% v = [2*pi*1200/(l(915,1)-l(1,1)) 2*pi*1200/(r(625,1)-r(1,1)) ...
%     2*pi*250/(rr(291,1)-rr(1,1)) 2*pi*250/(ll(455,1)-ll(1,1)),...
%     0.094]*1000;
% v = [2*pi*1200/(l(915,1)-l(1,1)) 2*pi*1200/(r(625,1)-r(1,1)) ...
%     2*pi*160/(rr(291,1)-rr(1,1)) 2*pi*250/(ll(455,1)-ll(1,1)),...
%     0.094]*1000;
% omega = [2*pi/(l(915,1)-l(1,1)) -2*pi/(r(625,1)-r(1,1)) ...
%     -2*pi*0.65/(rr(291,1)-rr(1,1)) 2*pi*0.99/(ll(430,1)-ll(1,1)),0]*1000;
% omega = [0.08,0.08,0.17,0.17,0];
% v = [100,100,50,50,100];

% dlmwrite('left.csv',llnew,'precision','%.3f')
% dlmwrite('right.csv',rrnew,'precision','%.3f')
% dlmwrite('slight_right.csv',rnew,'precision','%.3f')
% dlmwrite('slight_left.csv',lnew,'precision','%.3f')
% dlmwrite('straight.csv',snew,'precision','%.3f')


% figure(1)
% hold on
% plot(s(:,2),s(:,3));
% grid on
% xlabel('x,mm')
% ylabel('y,mm')
% title('Straight movement')
% axis equal
% hold off
% 
% figure(2)
% hold on
% plot(l(:,2),l(:,3));
% plot((max(l(:,2))+min(l(:,2)))/2,(max(l(:,3))+min(l(:,3)))/2,'*')
% grid on
% xlabel('x,mm')
% ylabel('y,mm')
% title('Slight left movement')
% axis equal
% hold off
% 
% figure(3)
% hold on
% plot(r(:,2),r(:,3));
% plot((max(r(:,2))+min(r(:,2)))/2,(max(r(:,3))+min(r(:,3)))/2,'*')
% grid on
% xlabel('x,mm')
% ylabel('y,mm')
% title('Slight right movement')
% axis equal
% hold off
% 
% figure(4)
% hold on
% plot(ll(:,2),ll(:,3));
% plot((max(ll(:,2))+min(ll(:,2)))/2,(max(ll(:,3))+min(ll(:,3)))/2,'*')
% grid on
% xlabel('x,mm')
% ylabel('y,mm')
% title('Left movement')
% axis equal
% hold off
% 
% figure(5)
% hold on
% plot(rr(:,2),rr(:,3));
% plot((max(rr(:,2))+min(rr(:,2)))/2,(max(rr(:,3))+min(rr(:,3)))/2,'*')
% grid on
% xlabel('x,mm')
% ylabel('y,mm')
% title('Right movement')
% axis equal
% hold off
