%%%%%% HÄR BÖRJAR JOEL KOD %%%%%%

%%% Create BW Image %%%
I = imread('coins.tif');    % read image 
T = graythresh(I);          % find appropriate bw threshold T
Ibw = im2bw(I,T);           % create bw image with threshold
se=strel('disk',1,8);       % create a morph object se
ibwer = imerode(Ibw,se);    % erode bw image with morph object se

%%% dicretize %%%
Idist=bwdist(ibwer,'euclidean');    % apply distance transform, euclidean type
Imax = -imextendedmax(Idist,5);      % find local maximas
Iws = watershed(Imax);

result = I;
result(Iws == 0) = 0;
imshow(result)

% figure
% imshow(Imax)
% figure
% imshow(uint8((double(Iws)+double(I))))
% figure
% imshow(Imax)
% figure
% imshow(or(I,Imax))
%imshow(IW)

% imshow(mat2gray(Idist));

%%%%%% HÄR BÖRJAR ALEX KOD %%%%%%
% clear all
% I = imread('coins.tif');
% imshow(I);
% T=graythresh(I);
% Ithresh=im2bw(I,T);
% imshow(Ithresh);
% 
% Idist=bwdist(Ithresh,'euclidean');
% imshow(mat2gray(Idist));
% Iwater=watershed(Idist);
% imshow(Iwater);
% Iextended=imextendedmax(Idist,1);
% imshow(Iextended);
% 
% se=strel('disk',1,8);
% imbwer = imerode(Ithresh,se);
% 
% imshow(imbwer)
% Idist=-bwdist(imbwer);
% imshow(mat2gray(Idist));
% Iextended=imextendedmax(Idist,1);
% imshow(Iextended);
% Iwater=watershed(Idist);
% imshow(label2rgb(Iwater))
% 
% bw2 = I;
% bw2(Iwater == 0) = 0;
% imshow(bw2)
% 
