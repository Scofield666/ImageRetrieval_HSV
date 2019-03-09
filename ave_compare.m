%% 对于同一张图片 采取同一种距离计算公式 比较非均匀量化和均匀量化的效果
function [] = ave_compare(discalc_option)
    ave_dis1 = zeros(1,5);
    ave_dis2 = zeros(1,5);
    ave_dis1(1) = retrieve('91.jpg',1,0,discalc_option);
    ave_dis2(1) = retrieve('91.jpg',2,0,discalc_option);
    ave_dis1(2) = retrieve('125.jpg',1,0,discalc_option);
    ave_dis2(2) = retrieve('125.jpg',2,0,discalc_option);
    ave_dis1(3) = retrieve('535.jpg',1,0,discalc_option);
    ave_dis2(3) = retrieve('535.jpg',2,0,discalc_option);
    ave_dis1(4) = retrieve('774.jpg',1,0,discalc_option);
    ave_dis2(4) = retrieve('774.jpg',2,0,discalc_option);
    ave_dis1(5) = retrieve('812.jpg',1,0,discalc_option);
    ave_dis2(5) = retrieve('812.jpg',2,0,discalc_option);
    x=1:1:5;
    plot(x,ave_dis1,'-*b','linewidth',0.8,'Markersize',7);
    hold on;
    plot(x,ave_dis2,'--sr','linewidth',0.8,'Markersize',7);
    legend('Nonuniform','Uniform'); 
    set(gca,'xtick',[0 1 2 3 4 5 6]);
    set(gca,'xticklabel',{'','91.jpg','125.jpg','535.jpg','774.jpg','812.jpg',''});
    if discalc_option==1
        axis([0,6,3e+03,6e+03]);
        xlabel('Query Image'); 
        ylabel('Euclidean Distance') ;
    elseif discalc_option==2
        axis([0,6,0,32]);
        xlabel('Query Image'); 
        ylabel('Histogram intersection') ;
    elseif discalc_option==3
        axis([0,6,0,12]);
        xlabel('Query Image'); 
        ylabel('Bhattacharyya distance') ;
    end
end