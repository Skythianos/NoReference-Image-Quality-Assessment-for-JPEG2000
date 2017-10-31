function [ A ] = SecondDistortionMeasure( img )

[M, N] = size(img);

img_Ad = zeros(M-4, N-4);

for i=3:(M-2)
    for j=3:(N-2)
        tmp = img(i-2:i+2, j-2:j+2);
        tmp = abs(tmp - tmp(3,3));
        Ad = (tmp(1,1)+tmp(1,2)+tmp(1,3)+tmp(1,4)+tmp(1,5)+tmp(2,1)+tmp(2,5)+tmp(3,1)+tmp(3,5)+tmp(4,1)+tmp(4,5)+tmp(5,1)+tmp(5,2)+tmp(5,3)+tmp(5,4)+tmp(5,5))/16;
        img_Ad(i-2,j-2) = Ad;
    end
end

[m, n] = size(img_Ad);
k = 1;

for i=3:4:(m-2)
    for j=3:4:(n-2)
        if(j+2<(n-2) && i+2<(m-2))
            tmp = img_Ad(i-2:i+2, j-2:j+2);
            Ad_avg(k) = mean(tmp(:));
            k = k+1;
        end
    end
end

A = mean(Ad_avg(:));

end

