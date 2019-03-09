%%
% Calculate The HSV histogram
% Nonuniform Quantization
% hist = hist_calc('125.jpg')
function Hist= hist_calc(input_img)

rgb_img = imread(input_img);
[m,n,o] = size(rgb_img);
[h,s,v] = rgb2hsv(rgb_img);
Hq =zeros(m,n);
Sq =zeros(m,n);
Vq =zeros(m,n);
h = h*360;
%% 
%��hsv�ռ�ǵȼ��������
%  h������16����
%  s������4����
%  v������4����
for i = 1:m
    for j = 1:n
        if h(i,j)<=15||h(i,j)>345
            Hq(i,j) = 0;
        end
        if h(i,j)<=25&&h(i,j)>15
            Hq(i,j) = 1;
        end
        if h(i,j)<=45&&h(i,j)>25
            Hq(i,j) = 2;
        end
        if h(i,j)<=55&&h(i,j)>45
            Hq(i,j) = 3;
        end
        if h(i,j)<=80&&h(i,j)>55
            Hq(i,j) = 4;
        end
        if h(i,j)<=108&&h(i,j)>80
            Hq(i,j) = 5;
        end
        if h(i,j)<=140&&h(i,j)>108
            Hq(i,j) = 6;
        end
        if h(i,j)<=165&&h(i,j)>140
            Hq(i,j) = 7;
        end
        if h(i,j)<=190&&h(i,j)>165
            Hq(i,j) = 8;
        end
        if h(i,j)<=220&&h(i,j)>190
            Hq(i,j) = 9;
        end
        if h(i,j)<=255&&h(i,j)>220
            Hq(i,j) = 10;
        end
        if h(i,j)<=275&&h(i,j)>255
            Hq(i,j) = 11;
        end
        if h(i,j)<=290&&h(i,j)>275
            Hq(i,j) = 12;
        end
        if h(i,j)<=316&&h(i,j)>290
            Hq(i,j) = 13;
        end
        if h(i,j)<=330&&h(i,j)>316
            Hq(i,j) = 14;
        end
        if h(i,j)<=345&&h(i,j)>330
            Hq(i,j) = 15;
        end
    end
end
for i = 1:m
    for j = 1:n
        if s(i,j)<=0.15&&s(i,j)>0
            Sq(i,j) = 0;
        end
        if s(i,j)<=0.4&&s(i,j)>0.15
            Sq(i,j) = 1;
        end
        if s(i,j)<=0.75&&s(i,j)>0.4
            Sq(i,j) = 2;
        end
        if s(i,j)<=1&&s(i,j)>0.75
            Sq(i,j) = 3;
        end
    end
end
for i = 1:m
    for j = 1:n
        if v(i,j)<=0.15&&v(i,j)>0
            Vq(i,j) = 0;
        end
        if v(i,j)<=0.4&&v(i,j)>0.15
            Vq(i,j) = 1;
        end
        if v(i,j)<=0.75&&v(i,j)>0.4
            Vq(i,j) = 2;
        end
        if v(i,j)<=1&&v(i,j)>0.75
            Vq(i,j) = 3;
        end
    end
end
%% 
%��������ɫ�����ϳ�Ϊһά����������L = H*Qs*Qv+S*Qv+v��Qs,Qv�ֱ���S��V����������
% �õ���L�Ƕ���ÿ�����ص����ɫ�����ĺ���������, Lȡֵ��Χ[0,255]
%ȡQs = 4; Qv = 4
L=zeros(m,n);
for  i = 1:m
    for j = 1:n
        L(i,j) = Hq(i,j)*16+Sq(i,j)*4+Vq(i,j);
    end
end
%% 
%����L��ֱ��ͼ
% ������ɫ����ֵ���� [0,255]��ÿһ��ֵ �����ص���Ŀ
Hist=zeros(1,256);
for i = 0:255
    Hist(i+1) = size(find(L==i),1);
end
end
