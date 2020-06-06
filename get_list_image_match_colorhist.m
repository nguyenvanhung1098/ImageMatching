function [list_image_match_colorhist, filenames] = get_list_image_match_colorhist(path_images, EUCLID)
% Kiem tra anh tu duong dan path_images theo khoang cach Euclid hoac Cosine
% co match voi anh nao trong tap data nguon khong
        
     % tinh color_ histogram cua anh dau vao 
     images = imread(path_images);
     red = imhist(images(:,:,1));
     blue = imhist(images(:,:,2));
     green = imhist(images(:,:,3));
     [n m ] = size(red);
     images_hist = [red; blue; green] / (m * n);
     % tinh color histogram cua anh nguon
     [mt_color_hist_dataset, filenames] = get_color_hist_dataset();
     total_images = numel(filenames);
     list_image_match_colorhist = mt_color_hist_dataset;
     if(EUCLID)
        %tinh khoang cach Euclid
        list_image_match_colorhist = mt_color_hist_dataset - images_hist;
        list_image_match_colorhist = list_image_match_colorhist.^2;
        list_image_match_colorhist = sum(list_image_match_colorhist);
        list_image_match_colorhist = sqrt(list_image_match_colorhist);
        list_image_match_colorhist = [list_image_match_colorhist ; 1 : total_images ];
        % sap xep theo thu tu giam dan match giua 2 anh
        for i = 1:total_images
             for j = i:total_images
                 if(list_image_match_colorhist(1,i) > list_image_match_colorhist(1,j))
                    tmp = list_image_match_colorhist(1,i);
                    list_image_match_colorhist(1,i) = list_image_match_colorhist(1,j);
                    list_image_match_colorhist(1,j) = tmp;
                    tmp = list_image_match_colorhist(2,i);
                    list_image_match_colorhist(2,i) = list_image_match_colorhist(2,j);
                    list_image_match_colorhist(2,j) = tmp;               
                 end
             end    
        end
     else
        % Do khoang cach Cosine
        list_image_match_colorhist = sum(list_image_match_colorhist.*images_hist)./sqrt(sum(list_image_match_colorhist.^2)*sum(images_hist.^2));
        list_image_match_colorhist = [list_image_match_colorhist ; 1 : total_images ];
        % sap xep theo thu tu giam dan match giua 2 anh
        for i = 1:total_images
             for j = i:total_images
                 if(list_image_match_colorhist(1,i) < list_image_match_colorhist(1,j))
                    tmp = list_image_match_colorhist(1,i);
                    list_image_match_colorhist(1,i) = list_image_match_colorhist(1,j);
                    list_image_match_colorhist(1,j) = tmp;
                    tmp = list_image_match_colorhist(2,i);
                    list_image_match_colorhist(2,i) = list_image_match_colorhist(2,j);
                    list_image_match_colorhist(2,j) = tmp;               
                 end
             end    
         end
     end
end

