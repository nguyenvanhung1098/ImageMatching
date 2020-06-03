function [mt_color_hist_dataset , filenames] = get_color_hist_dataset()
%get_color_hist_dataset doc vao cac anh tu tap nguon va tinh histgram cua
%cac anh.
    image_folder= 'C:\Users\ASUS\Desktop\BTL_XuLyAnh\data_xulyanh\dateset';
    filenames = dir(fullfile(image_folder,'*.png'));
    total_images = numel(filenames);
    mt_color_hist_dataset = [];
    for n = 1:total_images
        f = fullfile(image_folder, filenames(n).name);
        images = imread(f);
        red = imhist(images(:,:,1));
        blue = imhist(images(:,:,2));
        green = imhist(images(:,:,3));
        images_hist = [red; blue; green];
        mt_color_hist_dataset = [mt_color_hist_dataset , images_hist ];     
    end
end