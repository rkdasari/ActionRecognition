path = 'C:\Users\Radhakrishna\Desktop\HMDB_Subset\';
content = dir(path);
numfolders = size(content);

hcf = [];
for i = 3:numfolders(1)
    
 your_vtk_files = dir(fullfile(content(i).folder,content(i).name));
 alllist = your_vtk_files; 
    dirFlags = [alllist.isdir];
% Extract only those that are directories.
    subFolders = alllist(dirFlags);
    contenthc = dir(fullfile(content(i).folder,content(i).name, subFolders(3).name));
    hcfc = open(fullfile(contenthc(i).folder,contenthc(i).name));
    for i = 3:93
    hcfc = open(fullfile(contenthc(i).folder,contenthc(i).name));
    hcf = [hcf;hcfc.tottrajs];
    end
 
end
    
    %matfile = fullfile(content(i).folder,content(i).name, subFolders(3).name,[your_vtk_files{1,kv},'.mat']);

