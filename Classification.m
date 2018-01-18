
clear all;
close all;

dict = open('trajdictsmall.mat');

hc = 'C:\Users\Radhakrishna\Desktop\RKActionRecognition\KTH\handclappingtraj\';
hv = 'C:\Users\Radhakrishna\Desktop\RKActionRecognition\KTH\handwavingtraj\';
run = 'C:\Users\Radhakrishna\Desktop\RKActionRecognition\KTH\runningtraj\';
walk = 'C:\Users\Radhakrishna\Desktop\RKActionRecognition\KTH\walkingtraj\';
jog = 'C:\Users\Radhakrishna\Desktop\RKActionRecognition\KTH\joggingtraj\';
box = 'C:\Users\Radhakrishna\Desktop\RKActionRecognition\KTH\boxingtraj\';

contenthc = dir(hc);
contenthv = dir(hv);
contentrun = dir(run);
contentwalk = dir(walk);
contentjog = dir(jog);
contentbox = dir(box);

hcf = [];
hvf = [];
runf =[];
walkf = [];
jogf = [];
boxf = [];

for i = 3:101
    
     hcfc = open(fullfile(contenthc(i).folder,contenthc(i).name));
     histhc = traj_hist(hcfc.tottrajs,dict.C);
     hcf = [hcf;[histhc,1]];
    hvfc = open(fullfile(contenthv(i).folder,contenthv(i).name));
    histhv = traj_hist(hvfc.tottrajs,dict.C);
    hvf = [hvf;[histhv,2]];
    runfc = open(fullfile(contentrun(i).folder,contentrun(i).name));
    histrun = traj_hist(runfc.tottrajs,dict.C);
    runf = [runf;[histrun,3]];
    walkfc = open(fullfile(contentwalk(i).folder,contentwalk(i).name));
    histwalk = traj_hist(walkfc.tottrajs,dict.C);
    walkf = [walkf;[histwalk,4]];
    jogfc = open(fullfile(contentjog(i).folder,contentjog(i).name));
    histjog = traj_hist(jogfc.tottrajs,dict.C);
    jogf = [jogf;[histjog,5]];
     boxfc = open(fullfile(contentbox(i).folder,contentbox(i).name));
     histbox = traj_hist(boxfc.tottrajs,dict.C);
     boxf = [boxf;[histbox,6]];
    
    
end

trainingdata = [hcf;hvf;runf;walkf;jogf;boxf];




