function [ k1,k2,b1,b2 ] = step2error( data,k1,k2,b1,b2 )
k1 = 1;
k2 = 1;
b1 = 0;
b2 = 0;

err = 0;
omega = k2*2*pi/(data(end,1)-data(1,1))+b2;
v = k1*2*pi*1200/(data(end,1)-data(1,1))+b1;
u = [v, omega];

for i=1:9
    dt = data(i+1,1)-data(i,1);
    pose = data(i,2:4);
    
    predicted = predict_pose(u,pose,dt);
    true_next = data(i+1,2:4);
    err = err + norm(predicted - true_next)
end
err

end

