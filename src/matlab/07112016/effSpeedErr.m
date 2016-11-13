function [ err ] = effSpeedErr(param, data,u)

predicted = data(1,2:4);
err = 0;

a = [0,0,0,0,0,0];
for i=1:length(data)-1
    dt = (data(i+1,1)-data(i,1))/1000;
    
    predicted = predict_pose(u,predicted,dt,a,param);
    err = err + norm(predicted(1:2) - data(i+1,2:3))+20*norm(predicted(3) - data(i+1,4));
end

end

