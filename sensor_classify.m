
clear all;
close all;

dict = open('sensortrajsstabdict.mat');

hc = 'C:\Users\Radhakrishna\Desktop\MyDatasetStab\box\boxtrajs\';
hv = 'C:\Users\Radhakrishna\Desktop\MyDatasetStab\clap\claptrajs\';
run = 'C:\Users\Radhakrishna\Desktop\MyDatasetStab\Jog\jogtrajs\';
walk = 'C:\Users\Radhakrishna\Desktop\MyDatasetStab\sit\sittrajs\';
jog = 'C:\Users\Radhakrishna\Desktop\MyDatasetStab\stand\standtrajs\';
box = 'C:\Users\Radhakrishna\Desktop\MyDatasetStab\walk\walktrajs\';
hor = 'C:\Users\Radhakrishna\Desktop\MyDatasetStab\wave\wavetrajs\';
% wa = 'C:\Users\Radhakrishna\Desktop\HMDB_Subset\wave\wavetrajs\';
% wal = 'C:\Users\Radhakrishna\Desktop\HMDB_Subset\walk\walktrajs\';




contenthc = dir(hc);
contenthv = dir(hv);
contentrun = dir(run);
contentwalk = dir(walk);
contentjog = dir(jog);
contentbox = dir(box);
contenthor = dir(hor);
% contentwa = dir(wa);
% contentwal = dir(wal);


hcf = [];
hvf = [];
runf =[];
walkf = [];
jogf = [];
boxf = [];
horf = [];
waf = [];
walf = [];

for i = 3:16
    
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
     
     horfc = open(fullfile(contenthor(i).folder,contenthor(i).name));
     histhor = traj_hist(horfc.tottrajs,dict.C);
     horf = [horf;[histhor,7]];
     
%           wafc = open(fullfile(contentwa(i).folder,contentwa(i).name));
%      histwa = traj_hist(wafc.tottrajs,dict.C);
%      waf = [waf;[histwa,8]];
%      
%           walfc = open(fullfile(contentwal(i).folder,contentwal(i).name));
%      histwal = traj_hist(walfc.tottrajs,dict.C);
%      walf = [walf;[histwal,9]];
    
    
end

trainingdata = [hcf;hvf;runf;walkf;jogf;boxf;horf];




