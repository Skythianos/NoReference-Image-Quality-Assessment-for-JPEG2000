function [ S ] = FirstDistortionMeasure( img )

[M, N] = size(img);

img_std = zeros(M-4, N-4);

for i=3:(M-2)
    for j=3:(N-2)
        tmp = img(i-2:i+2, j-2:j+2);
        img_std(i-2,j-2) = std(tmp(:));
    end
end

[m, n] = size(img_std);
k = 1;

for i=3:4:(m-2)
    for j=3:4:(n-2)
        if(j+2<(n-2) && i+2<(m-2))
            tmp = img_std(i-2:i+2, j-2:j+2);
            std_avg(k) = mean(tmp(:));
            k = k+1;
        end
    end
end

S = mean(std_avg(:));

end

