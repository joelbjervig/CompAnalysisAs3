%%%%%% HÄR BÖRJAR JOEL KOD %%%%%%

%%% Create BW Image %%%
I = imread('coins.tif');    % read image 
T = graythresh(I);          % find appropriate bw threshold T
Ibw = im2bw(I,T);           % create bw image with threshold
se=strel('disk',1,8);       % create a morph object se
ibwer = imerode(Ibw,se);    % erode bw image with morph object se

%%% dicretize %%%
Idist=bwdist(ibwer,'euclidean');    % apply distance transform, euclidean type
Imax = imextendedmax(Idist,1);      % find local maximas

%IW = watershed(Imax);

%imshow(mat2gray(Idist));
figure;
imshow(I)
%figure
%imshow(ibwer)
figure
imshow(Imax)
figure
imshow(or(I,Imax))
%imshow(IW)

% imshow(mat2gray(Idist));

%%%%%% HÄR BÖRJAR ALEX KOD %%%%%%