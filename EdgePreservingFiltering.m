function [ result ] = EdgePreservingFiltering( img )
[M, N] = size(img);
result = zeros(M-2, N-2);

for i=2:(M-1)
    for j=2:(N-1)
        X = img(i,j);
        I = img(i-1,j);
        J = img(i+1,j);
        K = img(i,j-1);
        L = img(i,j+1);
        Hd = K -2*X + L;
        Vd = I -2*X + J;
        if(Hd<Vd)
            X = (K+2*X+L)/4;
        else
            X = (I+2*X+J)/4;
        end
        result(i-1,j-1)=X;
    end
end

end

