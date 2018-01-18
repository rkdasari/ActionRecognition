
clear all;
close all;

curfolcdvs = 'C:\Users\Radhakrishna\Desktop\RKActionRecognition\KTHData\HandclappingMat\';
curfolbb =  'C:\Users\Radhakrishna\Desktop\RKActionRecognition\KTHData\handclappingbb\';
curfolvid = 'C:\Users\Radhakrishna\Desktop\RKActionRecognition\KTH\handclapping\';
writecdvs = 'C:\Users\Radhakrishna\Desktop\RKActionRecognition\KTH\handclappingtraj\';
contentcdvs = dir(curfolcdvs);
contentbb = dir(curfolbb);
contentvid = dir(curfolvid);
numfilescdvs = size(contentcdvs);
numfilesbb = size(contentbb);
pointTracker = vision.PointTracker;

for i = 3:102
    
    vid = VideoReader(fullfile(contentvid(i).folder,contentvid(i).name));
    cdvs = load(fullfile([curfolcdvs,contentcdvs(i).name]));
   % bb = load(fullfile([curfolbb,contentbb(i).name]));
    %aviobj = VideoWriter(fullfile([writecdvs,contentvid(i).name]));
   % open(aviobj);
    tottrajs = [];
    
    
    for j = 1:15:150
        if(hasFrame(vid))
        im2 = readFrame(vid);
        end
        pos   = [cdvs.vidcdvs{j,1}.featurelist.fullSizeX, cdvs.vidcdvs{j,1}.featurelist.fullSizeY];
        %color = {'red','white','green','magenta'};
        %RGB = insertMarker(im2,pos,'o','size',3);
        %RGB = insertShape(RGB,'Rectangle',bb.personcdvs2{j,1});
        %writeVideo(aviobj,uint8(RGB));
        if(j==1)
        initialize(pointTracker,pos,im2);
        end
        
        if(j>1)
            setPoints(pointTracker, pos);
        end
        
        trajs = [];
        for k = j+1:j+14
        if(hasFrame(vid))
        im2 = readFrame(vid);
        end   
        [points, validity] = step(pointTracker,im2);
        %RGB = insertShape(im2,'Line',[pos, points]); 
        trajs = [trajs, pos - points];
        
        
        pos = points;
        end
        
        tottrajs = [tottrajs;trajs];
        
   
        %plot(cdvs.viscdvs{i,1}.featurelist.fullSizeX, cdvs.viscdvs{i,1}.featurelist.fullSizeY, ['o' pc], 'MarkerFaceColor', pc);
        
        
    end
   
    save(fullfile([writecdvs,[contentvid(i).name,'.mat']]), 'tottrajs');
    release(pointTracker);
    
end