function [ ZC ] = ZCRate( img )

[M, N] = size(img);

dh = zeros(M, N-1);
dv = zeros(M-1, N);

dh_sign = zeros(M, N-1);
dv_sign = zeros(M-1, N);

dh_mul = zeros(M, N-2);
dv_mul = zeros(M-2, N);

zh = zeros(M, N-2);
zv = zeros(M-2, N);

for i=1:M
    for j=1:(N-1)
        dh(i,j) = img(i,j+1) - img(i,j);
        if dh(i,j)>0
            dh_sign(i,j) = 1;
        elseif dh(i,j)<0
            dh_sign(i,j) = -1;
        else
            dh_sign(i,j) = 0;
        end
    end
end

for i=1:(M-1)
    for j=1:N
        dv(i,j) = img(i+1,j) - img(i,j);
        if dv(i,j)>0
            dv_sign(i,j) = 1;
        elseif dv(i,j)<0
            dv_sign(i,j) = -1;
        else
            dv_sign(i,j) = 0;
        end
    end
end

for i=1:M
    for j=1:(N-2)
        dh_mul(i,j) = dh_sign(i,j) * dh_sign(i,j+1);
        if dh_mul(i,j)<0
            zh(i,j) = 1;
        else
            zh(i,j) = 0;
        end
    end
end

for i=1:(M-2)
    for j=1:N
        dv_mul(i,j) = dv_sign(i,j) * dv_sign(i+1,j);
        if dv_mul(i,j)<0
            zv(i,j) = 1;
        else
            zv(i,j) = 0;
        end
    end
end

[m, n] = size(zh);
k = 1;

for i=3:4:m
    for j=3:4:n
        if(j+2<n && i+2<m)
            tmp = zh(i-2:i+2, j-2:j+2);
            Zbh(k) = mean(tmp(:));
            k = k+1;
        end
    end
end

Zh = mean(Zbh);

[m, n] = size(zv);
k = 1;

for i=3:4:m
    for j=3:4:n
        if(j+2<n && i+2<m)
            tmp = zv(i-2:i+2, j-2:j+2);
            Zvh(k) = mean(tmp(:));
            k = k+1;
        end
    end
end

Zv = mean(Zvh);

ZC = (Zh + Zv) / 2;

end

