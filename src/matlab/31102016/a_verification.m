close all;
a = [  1.43007919e-02   4.78167832e-02   1.02682689e-06   6.61797497e-02 9.07458840e-09   8.03642769e-02];
pl =[l(700,2:4)];
pl(1,3)= pl(1,3)+pi;
% pll = [ll(1,2:4)];
pr =[r(1,2:4)];
pr(1,3)= pr(1,3)+0;
prr = [rr(1,2:4)];
ps = [s(1,2:4)];
err = [];

for i=2:50%length(lnew)
    pl = [pl; predict_pose([v(1),omega(1)],pl(i-1,:),(l(i,1)-l(i-1,1))/1000,a)  ];    
end

for i=2:100%length(rnew)
    pr = [pr; predict_pose([v(2),omega(2)],pr(i-1,:),(r(i,1)-r(i-1,1))/1000,a)  ];    
end

for i=2:100%length(rrnew)
    prr = [prr; predict_pose([v(3),omega(3)],prr(i-1,:),(rr(i,1)-rr(i-1,1))/1000,a)  ];    
end
pll = {};
for j=1:5
    pll{j} = [ll(1,2:4)];
    for i=2:120%length(ll)
        pll{j} = [pll{j}; predict_pose([v(4),omega(4)],pll{j}(i-1,:),(ll(i,1)-ll(i-1,1))/1000,a)  ];    
    end
    
end
for i=2:length(s)
    ps = [ps; predict_pose([v(5),omega(5)], ps(i-1,:),(s(i,1)-s(i-1,1))/1000,a)  ];    
end



figure(1)
hold on
plot(pl(:,1),pl(:,2),'g');
plot(l(700:750,2),l(700:750,3),'r');
plot(l(700,2),l(700,3),'d','linewidth',12);
title('Predicted movement vs real, slight left')
hold off
legend('Predicted','True','Start position')
grid on

figure(2)
hold on
plot(pr(:,1),pr(:,2),'g');
plot(r(2:100,2),r(2:100,3),'r');
plot(r(1,2),r(1,3),'d','linewidth',12);
title('Predicted movement vs real, slight right')
hold off
legend('Predicted','True','Start position')
grid on

figure(3)
hold on
plot(prr(:,1),prr(:,2),'g');
plot(rr(2:100,2),rr(2:100,3),'r');
plot(rr(1,2),rr(1,3),'d','linewidth',12);
title('Predicted movement vs real,right')
hold off
legend('Predicted','True','Start position')
grid on

figure(4)
hold on
plot(ll(2:100,2),ll(2:100,3),'r');
plot(ll(1,2),ll(1,3),'d','linewidth',12);
title('Predicted movement vs real,left')
plot(pll{1}(:,1),pll{1}(:,2),'g');
plot(pll{2}(:,1),pll{1}(:,2),'g');
plot(pll{3}(:,1),pll{1}(:,2),'g');
plot(pll{4}(:,1),pll{1}(:,2),'g');
plot(pll{5}(:,1),pll{1}(:,2),'g');

hold off
legend('True','Start position','Predicted')
grid on

% figure(5)
% hold on
% plot(ps(:,1),ps(:,2),'g');
% plot(s(2:end,2),s(2:end,3),'r');
% plot(s(1,2),s(1,3),'d','linewidth',12);
% title('Predicted movement vs real,straight')
% hold off
% legend('Predicted','True','Start position')
% grid on