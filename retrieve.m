%%
% dis = retrieve('125.jpg',1,1,1)
% input:
% query_img:'125.jpg'
% data_option:1--Nonuniformed quantization hist   2--uniformed quantization hist
% show_option:whether to show the candidate images
% discalc_option:1--euclidean   2--intersection   3--Bhattacharyya
% output:
% ave_dis: average euclidean distance
function [ave_dis] = retrieve(query_img,data_option,show_option,discalc_option)
FileDir = 'image.vary.jpg';
Filestruct = dir(fullfile(FileDir,'*.jpg'));
FileNames = {Filestruct.name}';
FileNum = length(FileNames);
dist_set = zeros(1,FileNum);
FileIndex = str2num(query_img(1:find(query_img=='.')-1))+1; 
if data_option==1
    load('Hist_cell.mat');
elseif data_option==2
    load('Hist_cell2.mat');
else
    fprintf('error:option=1/2!');
end
query_hist = hist_cell{FileIndex};
for i=1:FileNum
    dist_set(1,i) = dis_calc(query_hist,hist_cell{i},discalc_option);
end
[value,arg] = sort(dist_set);
arg(:,1)=[];
ave_dis = mean(dist_set(2:12));

if show_option==1
    figure;
    subplot(431);
    query_imgpath = strcat(FileDir,'\',query_img);
    imshow(query_imgpath);
    title('´ý²éÑ¯Í¼Ïñ');

    candidate1 = strcat(num2str(arg(1)-1),'.jpg');
    c_path_1 = strcat(FileDir,'\',candidate1);
    subplot(432);
    imshow(c_path_1);

    candidate2 = strcat(num2str(arg(2)-1),'.jpg');
    c_path_2 = strcat(FileDir,'\',candidate2);
    subplot(433);
    imshow(c_path_2);

    candidate3 = strcat(num2str(arg(3)-1),'.jpg');
    c_path_3 = strcat(FileDir,'\',candidate3);
    subplot(434);
    imshow(c_path_3);

    candidate4 = strcat(num2str(arg(4)-1),'.jpg');
    c_path_4 = strcat(FileDir,'\',candidate4);
    subplot(435);
    imshow(c_path_4);

    candidate5 = strcat(num2str(arg(5)-1),'.jpg');
    c_path_5 = strcat(FileDir,'\',candidate5);
    subplot(436);
    imshow(c_path_5);

    candidate6 = strcat(num2str(arg(6)-1),'.jpg');
    c_path_6 = strcat(FileDir,'\',candidate6);
    subplot(437);
    imshow(c_path_6);

    candidate7 = strcat(num2str(arg(7)-1),'.jpg');
    c_path_7 = strcat(FileDir,'\',candidate7);
    subplot(438);
    imshow(c_path_7);

    candidate8 = strcat(num2str(arg(8)-1),'.jpg');
    c_path_8 = strcat(FileDir,'\',candidate8);
    subplot(439);
    imshow(c_path_8);

    candidate9 = strcat(num2str(arg(9)-1),'.jpg');
    c_path_9 = strcat(FileDir,'\',candidate9);
    subplot(4,3,10);
    imshow(c_path_9);

    candidate10 = strcat(num2str(arg(10)-1),'.jpg');
    c_path_10 = strcat(FileDir,'\',candidate10);
    subplot(4,3,11);
    imshow(c_path_10);

    candidate11 = strcat(num2str(arg(11)-1),'.jpg');
    c_path_11 = strcat(FileDir,'\',candidate11);
    subplot(4,3,12);
    imshow(c_path_11);
end
end