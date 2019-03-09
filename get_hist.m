%%
% Get and store the histogram of each image.
% Adopt hist_calc(alternative) to calcaulate the histogram.
FileDir = 'image.vary.jpg';
Filestruct = dir(fullfile(FileDir,'*.jpg'));
% Filestruct = sortObj(Filestruct);
FileNames = {Filestruct.name}';
FileNum = length(FileNames);
hist_cell = cell(1,FileNum);
for FileCount = 1:FileNum
    Filename = strcat(num2str(FileCount-1),'.jpg');
    CurrentFile = fullfile(FileDir, Filename);
    CurrentHist = hist_calc(CurrentFile);
    hist_cell{FileCount} = CurrentHist;
end