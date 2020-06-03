function [mt_LBP_dataset , filenames] = get_list_LBP_dataset()
%get_color_hist_dataset doc vao cac anh tu tap nguon va tinh histgram cua
%cac anh.
    image_folder= 'C:\Users\ASUS\Desktop\BTL_XuLyAnh\data_xulyanh\dateset';
    filenames = dir(fullfile(image_folder,'*.png'));
    total_images = numel(filenames);
    mt_LBP_dataset = [];
    for n = 1:total_images
        f = fullfile(image_folder, filenames(n).name);
        images = imread(f);
        image = rgb2gray(images);
        LBP = get_LBP(image);
        mt_LBP_dataset = [mt_LBP_dataset , LBP ];     
    end
end