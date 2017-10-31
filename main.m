clear all
close all

% This MATLAB code is an implementation of 
% Sazzad et al.'s paper "No reference image quality assessment for JPEG2000 based on spatial features".

tic

img = imread('peppers.png');
img = rgb2gray(img);
img = im2double(img);
%img = imresize(img, [768 512]);

S = FirstDistortionMeasure(img);
A = SecondDistortionMeasure(img);
Z = ZCRate(img);
[ H, Hf, V, Vf ] = HistogramFeatures( img );

% MOS: 1-100
% Texas LIVE Database
gamma1 = 2.8507;  gamma2 = -3.4735; gamma3 = 22.1784;
gamma4 = 2.2957;  gamma5 = 0.0096;  gamma6 = 0.3619;
gamma7 = -0.3168; gamma8 = 0.0452;  gamma9 = 2.7841;

C = (gamma1*log(S+1) + gamma2*log(A+1) + gamma3*log(Z+gamma4)) * (gamma5*log(Hf+1) + gamma6*log(Vf+1) + gamma7*log(H+1) + gamma8*log(V+1) +gamma9);

b1=78.0058; b2=1.0346; b3=49.6925; b4=2.2622;

MOS = (b1) / (1+exp(-b2*(C-b3))) + b4;

toc