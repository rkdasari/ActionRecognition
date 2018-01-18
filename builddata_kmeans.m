
clear all;
close all;

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
    hcf = [hcf;hcfc.tottrajs];
    hvfc = open(fullfile(contenthv(i).folder,contenthv(i).name));
    hvf = [hvf;hvfc.tottrajs];
    runfc = open(fullfile(contentrun(i).folder,contentrun(i).name));
    runf = [runf;runfc.tottrajs];
    walkfc = open(fullfile(contentwalk(i).folder,contentwalk(i).name));
    walkf = [walkf;walkfc.tottrajs];
    jogfc = open(fullfile(contentjog(i).folder,contentjog(i).name));
    jogf = [jogf;jogfc.tottrajs];
    boxfc = open(fullfile(contentbox(i).folder,contentbox(i).name));
    boxf = [boxf;boxfc.tottrajs];
end







