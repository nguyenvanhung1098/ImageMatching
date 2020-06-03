function [mt_color_moment_dataset , filenames] = get_color_moment_dataset()
%get_color_hist_dataset doc vao cac anh tu tap nguon va tinh histgram cua
%cac anh.
    image_folder= 'C:\Users\ASUS\Desktop\BTL_XuLyAnh\data_xulyanh\dateset';
    filenames = dir(fullfile(image_folder,'*.png'));
    total_images = numel(filenames);
    mt_color_moment_dataset = [];
    for n = 1:total_images
        f = fullfile(image_folder, filenames(n).name);
        images = imread(f);
        images_hsv = rgb2hsv(images);
        
        h_value = imhist(images_hsv(:,:,1));
        h_mean = mean(h_value);
        [N,M] = size(h_value);
        h_moment2 = sqrt(sum((h_value - h_mean).^2)/N);
        h_moment3 = (sum((h_value - h_mean).^3)/N).^(1/3);
        
        s_value = imhist(images_hsv(:,:,2));
        s_mean = mean(s_value);
        [N,M] = size(s_value);
        s_moment2 = sqrt(sum((s_value - s_mean).^2)/N);
        s_moment3 = (sum((s_value - s_mean).^3)/N).^(1/3);
        
        v_value = imhist(images_hsv(:,:,3));
        v_mean = mean(v_value);
        [N,M] = size(v_value);
        v_moment2 = sqrt(sum((v_value - v_mean).^2)/N);
        v_moment3 = (sum((v_value - v_mean).^3)/N).^(1/3);
        
        
        images_moment_hist = [h_mean; h_moment2; h_moment3; s_mean; s_moment2; s_moment3; v_mean; v_moment2; v_moment3];
        mt_color_moment_dataset = [mt_color_moment_dataset , images_moment_hist];     
    end
    mt_color_moment_dataset = real(mt_color_moment_dataset);
end
