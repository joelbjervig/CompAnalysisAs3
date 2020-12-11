%%%%%% HÄR BÖRJAR JOEL KOD %%%%%%

%%% Create BW Image %%%
Im = imread('coins.tif');    % read image 

% I = imgaussfilt(Im,5);
% I = I./Im;
I=Im;

%%% for blurred image
T = graythresh(I);          % find appropriate bw threshold T
Ibw = im2bw(I,T);           % create bw image with threshold
se=strel('disk',1,8);       % create a morph object se
Ibwer = imerode(Ibw,se);    % erode bw image with morph object se

% dicretize 
Idist=bwdist(Ibwer,'euclidean');    % apply distance transform, euclidean type
Imax = -imextendedmax(Idist,4);      % find local maximas
Iws = watershed(Imax);

result = Im;
result(Iws == 0) = 0;


% figure
% 
% subplot(1,2,1)
% imshow(Im)
% subplot(1,2,2)
% imshow(I)

figure
subplot(2,3,1)
imshow(Im)
subplot(2,3,2)
imshow(Ibw)
subplot(2,3,3)
imshow(Ibwer)

subplot(2,3,4)
imshow(Idist)
subplot(2,3,5)
imshow(-Imax)
subplot(2,3,6)
imshow(result)



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
