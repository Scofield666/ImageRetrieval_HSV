%%
% distance = dis_calc(hist_cell{1},hist_cell{2},1)
% option
% 1: Euclidean distance
% 2: Histogram intersection
% 3: Bhattacharyya distance
function distance = dis_calc(query_imghist,dst_imghist,option)
distance_tmp = 0;
sim_tmp = 0;
pixel_num = 0;
length = size(query_imghist,2);
% Euclidean distance
if option==1
    for i=1:length
        distance_tmp = distance_tmp + (query_imghist(1,i)-dst_imghist(1,i))^2;
    end
    distance = sqrt(distance_tmp);
% Histogram intersection
elseif option==2
    for i=1:length
        sim_tmp = sim_tmp + min(query_imghist(1,i),dst_imghist(1,i));
        pixel_num = pixel_num + query_imghist(1,i);
    end
    distance = pixel_num/sim_tmp; % Normalization
% Bhattacharyya distance
elseif option==3
    for i=1:length
        sim_tmp = sim_tmp + sqrt(query_imghist(1,i) * dst_imghist(1,i));
        pixel_num = pixel_num + query_imghist(1,i);
    end
    distance = pixel_num/sim_tmp;% Normalization
end