function [list_image_match_colormoments, filenames] = get_list_image_match_colormoments(path_images, EUCLID)
% Kiem tra anh tu duong dan path_images theo khoang cach Euclid hoac Cosine
% co match voi anh nao trong tap data nguon khong
        
     % tinh color_ histogram cua anh dau vao 
     image = imread(path_images);
     images_hsv = rgb2hsv(image);
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


     images_moment_hist = [h_mean; h_moment2; h_moment3; 
                           s_mean; s_moment2; s_moment3;
                           v_mean; v_moment2; v_moment3];
     % tinh color histogram cua anh nguon
     [mt_color_moment_dataset , filenames] = get_color_moment_dataset();
     total_images = numel(filenames);
     list_image_match_colormoments = mt_color_moment_dataset;
     if(EUCLID)
        %tinh khoang cach Euclid
        list_image_match_colormoments = mt_color_moment_dataset - images_moment_hist;
        list_image_match_colormoments = list_image_match_colormoments.^2;
        list_image_match_colormoments = sum(list_image_match_colormoments);
        list_image_match_colormoments = sqrt(list_image_match_colormoments);
        list_image_match_colormoments = [list_image_match_colormoments ; 1 : total_images ];
        % sap xep theo thu tu giam dan match giua 2 anh
        for i = 1:total_images
             for j = i:total_images
                 if(list_image_match_colormoments(1,i) > list_image_match_colormoments(1,j))
                    tmp = list_image_match_colormoments(1,i);
                    list_image_match_colormoments(1,i) = list_image_match_colormoments(1,j);
                    list_image_match_colormoments(1,j) = tmp;
                    tmp = list_image_match_colormoments(2,i);
                    list_image_match_colormoments(2,i) = list_image_match_colormoments(2,j);
                    list_image_match_colormoments(2,j) = tmp;               
                 end
             end    
        end
     else
        % Do khoang cach Cosine
        list_image_match_colormoments = sum(list_image_match_colormoments.*images_moment_hist)./sqrt(sum(list_image_match_colormoments.^2)*sum(images_moment_hist.^2));
        list_image_match_colormoments = [list_image_match_colormoments ; 1 : 1 : total_images ];
        % sap xep theo thu tu giam dan match giua 2 anh
        for i = 1:total_images
             for j = i:total_images
                 if(list_image_match_colormoments(1,i) < list_image_match_colormoments(1,j))
                    tmp = list_image_match_colormoments(1,i);
                    list_image_match_colormoments(1,i) = list_image_match_colormoments(1,j);
                    list_image_match_colormoments(1,j) = tmp;
                    tmp = list_image_match_colormoments(2,i);
                    list_image_match_colormoments(2,i) = list_image_match_colormoments(2,j);
                    list_image_match_colormoments(2,j) = tmp;               
                 end
             end    
         end
     end
end


