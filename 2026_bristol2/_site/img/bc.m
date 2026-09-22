N = 1e5; L = 1e1;
b = L*rand([1,N]);
c = rand([1,N]);
c0 = b.*c; c1 = b.*(1-c); % arithmetic
ch0 = b./(1-c); ch1 = b./c; % harmonic
% scatter(c1,c0,'.');
axis equal;
xlim([0 L/2]);
ylim([0 L/2]);
% hold on;
% newplot;
scatter(ch1,ch0,'.','red');
axis equal;
xlim([0 L/2]);
ylim([0 L/2]);
%values = hist3([c1(:) c0(:)]);
%contourf(values,[1 2 3 4 5 6 7 8 9])
%imagesc(values.')
%colorbar
%axis equal
%axis xy
