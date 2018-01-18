
clear all;
close all;


curfolcdvs = 'C:\Users\Radhakrishna\Desktop\RKActionRecognition\KTHData\HandwavingMat\';
curfolbb =  'C:\Users\Radhakrishna\Desktop\RKActionRecognition\KTHData\handwavingbb\';
curfolvid = 'C:\Users\Radhakrishna\Desktop\RKActionRecognition\KTH\handwaving\';
writecdvs = 'C:\Users\Radhakrishna\Desktop\RKActionRecognition\KTH\handwavingcdvs\';
contentcdvs = dir(curfolcdvs);
contentbb = dir(curfolbb);
contentvid = dir(curfolvid);
numfilescdvs = size(contentcdvs);
numfilesbb = size(contentbb);

for i = 3:102
    
    vid = VideoReader(fullfile(contentvid(i).folder,contentvid(i).name));
    cdvs = load(fullfile([curfolcdvs,contentcdvs(i).name]));
    bb = load(fullfile([curfolbb,contentbb(i).name]));
    aviobj = VideoWriter(fullfile([writecdvs,contentvid(i).name]));
    open(aviobj);
    
    
    
    for j = 1:150
        im2 = readFrame(vid);
        RGB = im2;
%          pos   = [cdvs.vidcdvs{j,1}.featurelist.fullSizeX, cdvs.vidcdvs{j,1}.featurelist.fullSizeY];
%         %color = {'red','white','green','magenta'};
%          RGB = insertMarker(im2,pos,'o','size',3);
%       
        if(j>1)
        
        isbbox = size(bb.personcdvs2{j,1});
        if(isbbox(1) == 0)
          bb.personcdvs2{j,1} =  bb.personcdvs2{j-1,1};
        else
          [xll,yll,xlr,ylr,xmp,ymp,xul,yul,xur,yur] =  bbox_coordinates(bb.personcdvs2{j,1});
        end
        features1 = [cdvs.vidcdvs{j-1,4}.x1,cdvs.vidcdvs{j-1,4}.y1];
        features2 = [cdvs.vidcdvs{j-1,4}.x2,cdvs.vidcdvs{j-1,4}.y2];
   
        
        
        
   
        %possiblematches = [cdvs.vidcdvs{j-1,4}.x1, cdvs.vidcdvs{j-1,4}.y1, cdvs.vidcdvs{j-1,4}.x2, cdvs.vidcdvs{j-1,4}.y2];
        possiblematches = [features1,features2];
         if(isbbox(1) > 0)
        %bboxfeatureidx1 = find(features1(:,1)> xll & features1(:,2) > yll & features1(:,1) < xur & features1(:,2)< yur);
        %possiblematches = possiblematches(bboxfeatureidx1,: );
        pos   = features1;
        %color = {'red','white','green','magenta'};
        RGB = insertMarker(im2,pos,'o','size',3);
        RGB = insertShape(RGB,'Rectangle',bb.personcdvs2{j,1});
        %bboxfeatureidx1 = find(possiblematches(:,1)> xll & possiblematches(:,2) > yll & possiblematches(:,1) < xur & possiblematches(:,2)< yur);
        sparseFlow = features1 - features2;
        %ValidMovement = find(abs(sparseFlow(:,1)) < 7 & abs(sparseFlow(:,2)) < 7 & (abs(sparseFlow(:,1)) > 0 | abs(sparseFlow(:,2)) > 0));
        ValidMovement = find(abs(sparseFlow(:,1)) < 8 & abs(sparseFlow(:,2)) < 8);
        RGB = insertShape(RGB,'Line',possiblematches(ValidMovement,:));    
         end
        end
        %plot(cdvs.viscdvs{i,1}.featurelist.fullSizeX, cdvs.viscdvs{i,1}.featurelist.fullSizeY, ['o' pc], 'MarkerFaceColor', pc);
        writeVideo(aviobj,uint8(RGB));
        
    end
    
    close(aviobj);
    
    
%    
%     im2 = readFrame(vid);
%     vidcdvs = cell(150,5);
%     D1 = cdvs_extract(im1(:,:,1), mode);
%     for j = 1:150
%      im1 = readFrame(vid);
%     D2 = cdvs_extract(im2(:,:,1), mode);
%      %% Change parameters
%    param = cdvs_parameters(mode);
%    param.ratioThreshold = 0.9;
% 
% %% Match descriptors
%   [score, pairs, proj_bbox] = cdvs_match(D1, D2, [], 0, param);
%   vidcdvs{j,1} = D1;
%   vidcdvs{j,2} = D2;
%   vidcdvs{j,3} = score;
%   vidcdvs{j,4} = pairs;
%   vidcdvs{j,5} = proj_bbox;
%   D1 = D2;
%     
%     end
%     matfile = fullfile(path,[content(i).name,'.mat']);
%     save(matfile,'vidcdvs');
end