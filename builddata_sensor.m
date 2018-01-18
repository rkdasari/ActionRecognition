clear all;
close all;
path = 'C:\Users\Radhakrishna\Desktop\MyDatasetStab\';
content = dir(path);
numfolders = size(content);

hcf = [];
for i = 3:numfolders(1)
    
    i
    
 your_vtk_files = dir(fullfile(content(i).folder,content(i).name));
 alllist = your_vtk_files; 
    dirFlags = [alllist.isdir];
% Extract only those that are directories.
    subFolders = alllist(dirFlags);
    contenthc = dir(fullfile(content(i).folder,content(i).name, subFolders(3).name));
    %hcfc = open(fullfile(contenthc(i).folder,contenthc(i).name));
    for j = 3:16
        
        j
    hcfc = open(fullfile(contenthc(j).folder,contenthc(j).name));
    hcf = [hcf;hcfc.tottrajs];
    end
 
end
    