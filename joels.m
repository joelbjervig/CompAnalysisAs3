clc;
clear all;
close all;
%%%%%% HÄR BÖRJAR JOEL KOD %%%%%%

%%% Create BW Image %%%
I = imread('bacteria.tif');    % read image 

T1 = graythresh(I);   	% find appropriate bw threshold T
Ibw1 = 1-im2bw(I,T1);     % create bw image with threshold
Ibw2 = imfill(Ibw1, 'holes');



%se=strel('disk',40);  % create a morph object se
%Iop = imopen(I,se);    % opem image I with morph object se
% 
% Idiff = Iop-I;          % image minus opened image 
% T2 = graythresh(Idiff); % find appropriate bw threshold T
% Ibw2 = im2bw(Idiff,T2);

% dicretize 
Idist= bwdist(1.-Ibw2,'euclidean');    % apply distance transform, euclidean type
Imax = imextendedmax(Idist,10);      % find local maximas
Iws = watershed(-Imax);


[Ilabel, N]=bwlabel(Ibw2);
% F=regionprops(Ilabel, 'area');
% area = [F.Area];
% radius = round((pi^(-1).*area).^(0.5));
% hist(radius);


result = Ibw2;
result(Iws == 0) = 0;


figure
% subplot(2,3,1)
% imshow(I)
% subplot(2,3,2)
% imshow(Ibw1)
% subplot(2,3,3)
% imshow(Ibw2)
% subplot(2,3,4)
% imagesc(Idist)
% subplot(2,3,5)
% imshow(Imax)
% subplot(2,3,6)
imshow(result)


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
