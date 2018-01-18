
clear all;
close all;

curfolcdvs = 'C:\Users\Radhakrishna\Desktop\RKActionRecognition\KTHData\RunningMat\';
curfolbb =  'C:\Users\Radhakrishna\Desktop\RKActionRecognition\KTHData\runningbb\';
curfolvid = 'C:\Users\Radhakrishna\Desktop\RKActionRecognition\KTH\running\';
writecdvs = 'C:\Users\Radhakrishna\Desktop\RKActionRecognition\KTH\runningcdvs\';
contentcdvs = dir(curfolcdvs);
contentbb = dir(curfolbb);
contentvid = dir(curfolvid);
numfilescdvs = size(contentcdvs);
numfilesbb = size(contentbb);
pointTracker = vision.PointTracker;

for i = 3:3
    
    vid = VideoReader(fullfile(contentvid(i).folder,contentvid(i).name));
    cdvs = load(fullfile([curfolcdvs,contentcdvs(i).name]));
    bb = load(fullfile([curfolbb,contentbb(i).name]));
    aviobj = VideoWriter(fullfile([writecdvs,contentvid(i).name]));
    open(aviobj);
    
    
    
    for j = 1:15:150
        im2 = readFrame(vid);
        pos   = [cdvs.vidcdvs{j,1}.featurelist.fullSizeX, cdvs.vidcdvs{j,1}.featurelist.fullSizeY];
        %color = {'red','white','green','magenta'};
        RGB = insertMarker(im2,pos,'o','size',3);
        RGB = insertShape(RGB,'Rectangle',bb.personcdvs2{j,1});
        writeVideo(aviobj,uint8(RGB));
        if(j==1)
        initialize(pointTracker,pos,im2);
        else
        setPoints(pointTracker, pos);
        end
        
        
        
        for k = j+1:j+14
        im2 = readFrame(vid);    
        [points, validity] = step(pointTracker,im2);
        RGB = insertShape(im2,'Line',[pos, points]); 
        pos = points;
        writeVideo(aviobj,uint8(RGB));
        end
        
   
        %plot(cdvs.viscdvs{i,1}.featurelist.fullSizeX, cdvs.viscdvs{i,1}.featurelist.fullSizeY, ['o' pc], 'MarkerFaceColor', pc);
        
        
    end
    
    close(aviobj);
    
    
end