function pcaCalculation(data, direction)

    [coeffs, projected_coords, latent] = pca(data);
    chiSquareTestGaussian(projected_coords(:,1),0.1)
    chiSquareTestGaussian(projected_coords(:,2),0.2)

    figure(1);
    subplot(1, 2, 1);
    plot(projected_coords(:,1), projected_coords(:,2),'+');
    grid on
    axis equal
    xlabel('1st Principal Component');
    ylabel('2nd Principal Component');
    title(strcat('Projected Coordinates for Going ', direction));
    subplot(1, 2, 2);
    plot(data(:,1),data(:,2),'g+',[mean(data(:,1)),mean(data(:,1))+coeffs(1)],[mean(mean(data(:,2))),mean(mean(data(:,2)))+coeffs(3)],'r',...
    [mean(data(:,1)),mean(data(:,1))+coeffs(2)],[mean(data(:,2)),mean(data(:,2))+coeffs(4)],'b');
    axis equal
    grid on
    xlabel('x');
    ylabel('y');
    title('PCA vectors');

    figure(2);
    subplot(2, 1, 1);
    hist(projected_coords(:,1));
    xlabel('Projected coordinates');
    ylabel('Frequency');
    title(strcat('1st Principal Comp. Histogram for Going ', direction));
    subplot(2, 1, 2);
    hist(projected_coords(:,2));
    xlabel('Projected coordinates');
    ylabel('Frequency');
    title(strcat('2nd Principal Comp. Histogram for Going ', direction));

end