function [mt_hist_HOG , filenames] = get_hist_HOG_dataset()
%get_color_hist_dataset doc vao cac anh tu tap nguon va tinh histgram cua
%cac anh.
    image_folder= 'C:\Users\ASUS\Desktop\BTL_XuLyAnh\data_xulyanh\dateset';
    filenames = dir(fullfile(image_folder,'*.png'));
    total_images = numel(filenames);
    mt_hist_HOG = [];
    mask_grad_x = [-1 -1 -1 ; 2 2 2 ; -1 -1 -1];
    mask_grad_y = [-1 2 -1 ; -1 2 -1 ; -1 2 -1];
    G = fspecial('gaussian',[5 5],2);
    for n = 1:total_images
        f = fullfile(image_folder, filenames(n).name);
        images = imread(f);
        image = rgb2gray(images);
        image = imfilter(image,G,'same');
        image_grad_x = filter2(mask_grad_x, image, 'same');
        image_grad_y = filter2(mask_grad_y, image, 'same') + 0.001;
        image = image_grad_x ./ image_grad_y;
        [m , n ] = size(image);
        image_hist_hog = [0 ; 0 ; 0 ; 0];
        for i  =  1:m
            for j = 1:n
                if (image(i,j) < -1)
                    image(i,j) = 1;
                    image_hist_hog(1,1) = image_hist_hog(1,1) + 1;
                elseif (image(i,j) < 0)
                    image(i,j) = 2;
                    image_hist_hog(2,1) = image_hist_hog(2,1) + 1;
                elseif (image(i,j) < 1)
                    image(i,j) = 3;
                    image_hist_hog(3,1) = image_hist_hog(3,1) + 1;
                else
                    image(i,j) = 4;
                    image_hist_hog(4,1) = image_hist_hog(4,1) + 1;
                end
            end
        end
        
        mt_hist_HOG = [mt_hist_HOG , image_hist_hog ];     
    end
end


