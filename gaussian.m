gfilter = [0.01, 0.02, 0.04, 0.02, 0.01; 0.02, 0.04, 0.08, 0.04, 0.02; 0.04, 0.08, 0.16, 0.08, 0.04; 0.02, 0.04, 0.08, 0.04, 0.02; 0.01, 0.02, 0.04, 0.02, 0.01]
trueGaussian = fspecial('gaussian', 5);
mesh(gfilter);
figure;mesh(trueGaussian);