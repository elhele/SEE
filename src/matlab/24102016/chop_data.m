function [ processed_data,omega,v ] = chop_data( data,angle )
angle = deg2rad(angle);
if angle == 30
    r = 1200;
end

if angle == 90
    r = 250;
end

processed_data = [];

step = floor(length(data)/40);

for i=1:40
    processed_data = [processed_data(i*step,:)];
end
omega = angle/(data(2,1)-data(1,1));
v = angle*r/(data(2,1)-data(1,1));


end

