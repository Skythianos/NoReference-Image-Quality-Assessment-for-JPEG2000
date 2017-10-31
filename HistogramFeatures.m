function [ H, Hf, V, Vf ] = HistogramFeatures( img )

[M, N] = size(img);

img_e = EdgePreservingFiltering(img);
[m, n] = size(img_e);

AbsDifH = zeros(M, N-1);
AbsDifV = zeros(M-1, N);

AbsDifH_e = zeros(m, n-1);
AbsDifV_e = zeros(m-1, n);

for i=1:M
    for j=1:(N-1)
        AbsDifH(i,j) = abs(img(i,j+1) - img(i,j));
    end
end

h0 = sum(AbsDifH(:) == 0);
h1 = sum(AbsDifH(:) == 1);
h2 = sum(AbsDifH(:) == 2);
H = (h0+h1+h2) / (M*N);

for i=1:(M-1)
    for j=1:N
        AbsDifV(i,j) = abs(img(i+1,j) - img(i,j));
    end
end

v0 = sum(AbsDifV(:) == 0);
v1 = sum(AbsDifV(:) == 1);
v2 = sum(AbsDifV(:) == 2);
V = (v0+v1+v2) / (M*N);

for i=1:m
    for j=1:(n-1)
        AbsDifH_e(i,j) = abs(img_e(i,j+1) - img_e(i,j));
    end
end

hf0 = sum(AbsDifH_e(:) == 0);
hf1 = sum(AbsDifH_e(:) == 1);
hf2 = sum(AbsDifH_e(:) == 2);
Hf = (hf0+hf1+hf2) / ((M-2)*(N-2));

for i=1:(m-1)
    for j=1:n
        AbsDifV_e(i,j) = abs(img_e(i+1,j) - img_e(i,j));
    end
end

vf0 = sum(AbsDifV_e(:) == 0);
vf1 = sum(AbsDifV_e(:) == 1);
vf2 = sum(AbsDifV_e(:) == 2);
Vf = (vf0+vf1+vf2) / ((M-2)*(N-2));

end

