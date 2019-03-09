%%
% Calculate The HSV histogram
% Uniform Quantization
function Hist= hist_calc2(input_img)
input_img = imread(input_img);
[M,N,O] = size(input_img);
if O~= 3
    error('3 components are needed for histogram');
end
hsv = uint8(255*rgb2hsv(input_img));

%��������
% bitshift(24,-3) ��ʾ24����2��3�η�
H_BITS = 4; S_BITS =2; V_BITS = 2;
H=bitshift(hsv(:,:,1),-(8-H_BITS));
S=bitshift(hsv(:,:,2),-(8-S_BITS));
V=bitshift(hsv(:,:,3),-(8-V_BITS));

%%
%�Ƚ��кϳɣ�Ȼ����ͳ��
L=zeros(M,N);
for i=1:M
    for j=1:N
        L(i,j)=16*H(i,j)+4*S(i,j)+V(i,j);
    end
end
%����L��ֱ��ͼ
Hist=zeros(1,256);
for i = 0:255
    Hist(i+1) = size(find(L==i),1);
end
end