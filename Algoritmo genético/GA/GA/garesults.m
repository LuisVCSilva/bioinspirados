function garesults(gaDat)
% Optional user task executed when the algorithm ends

% For instance, final result
disp('------------------------------------------------')
disp('######   RESULT   #########')
disp(['   Objective function for xmin: ' num2str(gaDat.fxmin)])
disp(['   xmin: ' mat2str(gaDat.xmin)])
disp(['   neval: ' mat2str(gaDat.MAXGEN*gaDat.NIND+gaDat.NIND)])
disp('------------------------------------------------')

figure(1)
plot(gaDat.plot(:,1),gaDat.plot(:,2),'r-');
xlabel('generation')
ylabel('objective function')
