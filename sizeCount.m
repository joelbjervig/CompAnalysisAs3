%joel-----------------
% coins = imread('coins.tif');
% imshow(coins);


%alex----------------
clear all
I = imread('coins.tif');
imshow(I);
T=graythresh(I);
Ithresh=im2bw(I,T);
imshow(Ithresh);

Idist=bwdist(Ithresh,'euclidean');
imshow(mat2gray(Idist));
Iwater=watershed(Idist);
imshow(Iwater);
Iextended=imextendedmax(Idist,1);
imshow(Iextended);

se=strel('disk',1,8);
imbwer = imerode(Ithresh,se);

imshow(imbwer)
Idist=-bwdist(imbwer);
imshow(mat2gray(Idist));
Iextended=imextendedmax(Idist,1);
imshow(Iextended);
Iwater=watershed(Idist);
imshow(label2rgb(Iwater))

bw2 = I;
bw2(Iwater == 0) = 0;
imshow(bw2)

