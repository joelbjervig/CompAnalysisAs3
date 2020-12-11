%%%%%% HÄR BÖRJAR JOEL KOD %%%%%%

%%% Create BW Image %%%
Im = imread('coins.tif');    % read image 
% Im = imread('bacteria.tif');
% I = imgaussfilt(Im,5);
% I = I./Im;
I=Im;

%%% for blurred image
T = graythresh(I);          % find appropriate bw threshold T
Ibw = im2bw(I,T);           % create bw image with threshold
se=strel('disk',1,8);       % create a morph object se
Ibwer = imerode(Ibw,se);    % erode bw image with morph object se

% dicretize 
Idist=bwdist(Ibwer);    % apply distance transform
Imax = -imextendedmax(Idist,4);      % find local maximas
Iws = watershed(Imax);


result = Im;
result(Iws == 0) = 0;

figure
Ibwer=imcomplement(Ibwer);
Ibwer(Iws==0)=0;
imshow(Ibwer)

[~,N] = bwlabel(-Imax);
[~, N2] = bwlabel(Iws);

figure
Ilabel=bwlabel(Ibwer);
imshow(label2rgb(Ilabel, 'spring'))

F= regionprops(Ilabel);
allBlobArea=[F.Area];
allowableAreaIndexes = allBlobArea > 500;
keeperIndexes = find(allowableAreaIndexes);
keeperBlobsImage = ismember(Ilabel, keeperIndexes);
imshow(label2rgb(keeperBlobsImage, 'spring'))
F=regionprops(keeperBlobsImage,'Area');
allBlobArea=[F.Area];
subplot(1,2,1)
histogram(allBlobArea)
subplot(1,2,2)
imshow(keeperBlobsImage)


% figure
subplot(2,3,1)
imshow(Im)
xlabel('reference pic')
subplot(2,3,2)
imshow(Ibw)
xlabel('black and white ref pic')
subplot(2,3,3)
imshow(Ibwer)
xlabel('removed noised')


subplot(2,3,4)
imshow (Idist)
xlabel('removed noised inverted')
subplot(2,3,5)
imshow(-Imax)
xlabel('local minima')
subplot(2,3,6)
imshow(result)
xlabel('watershed on picture with local minima')



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
