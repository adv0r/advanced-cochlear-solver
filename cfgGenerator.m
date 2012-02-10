L=0.35;
sFstart = 2000;
sFstop = 2200 ;
sRatio = 1.22;
sDf = 20;
tTot = 0;
tm = 0.05;
N=1000;
doubleCheck =1;
nonlin = (1:N)*20;

save('cfgGenerato.mat','sFstart','sFstop','N','tm','sDf','sRatio','L','tTot','nonlin','doubleCheck')