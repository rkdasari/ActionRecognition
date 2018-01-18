
path = 'C:\Users\Radhakrishna\Desktop\HMDB_Subset\';
content = dir(path);
numfolders = size(content);


for i = 3:numfolders(1)
    
 your_vtk_files = dir(fullfile(content(i).folder,content(i).name));
 alllist = your_vtk_files; 
 your_vtk_files = {your_vtk_files(:).name};
 [ext ext ext] = cellfun(@(x) fileparts(x),your_vtk_files,'uniformoutput',false);
 idx = strcmp('.avi',ext);
 your_vtk_files = your_vtk_files(idx);
 num_vids = size(your_vtk_files);

for kv = 1: num_vids(2)
    
   pointTracker = vision.PointTracker;

    vid = VideoReader(fullfile(content(i).folder,content(i).name,your_vtk_files{1,kv}));
    tottrajs = [];
    
    
    for j = 1:15:150
        if(hasFrame(vid))
        im2 = readFrame(vid);
        end
        
        poscorners   = detectHarrisFeatures(rgb2gray(im2));
        pos = poscorners.Location;
        sizepos = size(pos);
        
        if(sizepos(1) == 0)
            
                 im2 = readFrame(vid);
                  im2 = readFrame(vid);
                   im2 = readFrame(vid);
                   poscorners   = detectFASTFeatures(rgb2gray(im2));
                pos = poscorners.Location;
        end    
        
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
   
    %save(fullfile([writecdvs,[contentvid(i).name,'.mat']]), 'tottrajs');
    
    
    dirFlags = [alllist.isdir];
% Extract only those that are directories.
    subFolders = alllist(dirFlags);
    
    matfile = fullfile(content(i).folder,content(i).name, subFolders(3).name,[your_vtk_files{1,kv},'.mat']);
    save(matfile,'tottrajs');
    release(pointTracker);
end
end





