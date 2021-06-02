% 1输入原始图像 2加入噪声
x = imread('apple3.jpg');
imshow(x);title('orignal');
xNoise = imnoise(x,"gaussian");
imshow(xNoise);title('Apple add Gaussian Noise');


%展示红色分量  二值化
red = xNoise(:,:,1);
imshow(red);

%噪声去除 1均值滤波 2.中值滤波
h=fspecial('average') ;y1=imfilter(red, h);
y2=medfilt2(red,[3,3]);
imshow(red);title('noised_bw');
 imshow(y1);title('averageFilter');

 imshow(y2);title('midFilter');

%开运算 断开叶子
 bw = im2bw(y1);
 title('二值化图像')
 imshow(bw);
disLeaf = bwmorph(bw,'open');  %开运算
imshow(bw)
imshow(disLeaf)

DisBigNoise = bwareaopen(disLeaf, 500);
imshow(DisBigNoise)

%闭运算消除个别突出
i3 = bwmorph(DisBigNoise,'clos');  %闭运算
imshow(i3)

img_edge=edge(i3, 'canny');
imshow( img_edge);title('canny边缘检测');


