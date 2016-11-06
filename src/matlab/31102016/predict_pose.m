function [ pose ] = predict_pose( u,posep,dt, alpha )
vt = u(1)+normrnd(0,alpha(1)*abs(u(1))+alpha(2)*abs(u(2)));
omegat = u(2)+normrnd(0,alpha(3)*abs(u(1))+alpha(4)*abs(u(2)));
gamma = normrnd(0,alpha(5)*abs(u(1))+alpha(6)*abs(u(2)));
xp = posep(1);
yp = posep(2);
thetap = posep(3);

if omegat<0.001
    x = xp-vt*sin(thetap)+vt*sin(thetap+omegat*dt);
    y = yp+vt*cos(thetap)-vt*cos(thetap+omegat*dt);
else
    x = xp-vt/omegat*sin(thetap)+vt/omegat*sin(thetap+omegat*dt);
    y = yp+vt/omegat*cos(thetap)-vt/omegat*cos(thetap+omegat*dt);  
end
    

theta = thetap+omegat*dt+gamma*dt;

pose = [x,y,theta];

end

