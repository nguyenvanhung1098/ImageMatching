function [LBP] = get_LBP(image)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    LBP = image * 0;
    [n , m] = size(image);
    mas_matrix = [];
    % LBP
    scale = 2.^[7 6 5; 0 -inf 4; 1 2 3];
    for i = 2 : n - 1
        for j = 2 : m - 1
            mas_matrix = [image(i-1, j-1) image(i-1,j) image(i-1,j+1);
                          image(i, j-1) image(i, j) image(i, j+1);
                          image(i + 1, j-1) image(i + 1, j) image(i + 1, j+1)];
            mt = int8(image(i,j)) - int8(mas_matrix);
            mt = mt > 0;
            pattern = sum(sum(mt .* scale));
            LBP(i,j) = pattern;
        end
    end
    LBP = imhist(LBP);
    uni_patterm = [0, 1, 2, 3, 4, 6, 7, 8, 12, 14, 15, 16, 24, 28, 30, 31, 32, 48, 56, 60, 62, 63, 64, 96, 112, 120, 124, 126, 127, 128, 129, 131, 135, 143, 159, 191, 192, 193, 195, 199, 207, 223, 224, 225, 227, 231, 239, 240, 241, 243, 247, 248, 249, 251, 252, 253, 254 ,255];
    LBP_final = [];
    for i = 1 : 58
        LBP_final(i) = LBP(uni_patterm(i) + 1);
    end
    LBP_final(59) = n * m - sum(LBP_final);
    LBP = transpose(LBP_final);
end

