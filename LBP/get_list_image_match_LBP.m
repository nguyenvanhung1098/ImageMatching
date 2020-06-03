function [list_image_match_LBP, filenames] = get_list_image_match_LBP(path_images, EUCLID)
% Kiem tra anh tu duong dan path_images theo khoang cach Euclid hoac Cosine
% co match voi anh nao trong tap data nguon khong
        
     % tinh LBP cua anh dau vao 
     images = imread(path_images);
     image = rgb2gray(images);
     [LBP_images] = get_LBP(image);
     % tinh color LBP cua anh nguon
     [mt_LBP_dataset , filenames] = get_list_LBP_dataset();
     total_images = numel(filenames);
     list_image_match_LBP = mt_LBP_dataset;
     if(EUCLID)
        %tinh khoang cach Euclid
        list_image_match_LBP = mt_LBP_dataset - LBP_images;
        list_image_match_LBP = list_image_match_LBP.^2;
        list_image_match_LBP = sum(list_image_match_LBP);
        list_image_match_LBP = sqrt(list_image_match_LBP);
        list_image_match_LBP = [list_image_match_LBP ; 1 : total_images ];
        % sap xep theo thu tu giam dan match giua 2 anh
        for i = 1:total_images
             for j = i:total_images
                 if(list_image_match_LBP(1,i) > list_image_match_LBP(1,j))
                    tmp = list_image_match_LBP(1,i);
                    list_image_match_LBP(1,i) = list_image_match_LBP(1,j);
                    list_image_match_LBP(1,j) = tmp;
                    tmp = list_image_match_LBP(2,i);
                    list_image_match_LBP(2,i) = list_image_match_LBP(2,j);
                    list_image_match_LBP(2,j) = tmp;               
                 end
             end    
        end
     else
        % Do khoang cach Cosine
        list_image_match_LBP = sum(list_image_match_LBP.*LBP_images)./sqrt(sum(list_image_match_LBP.^2)*sum(LBP_images.^2));
        list_image_match_LBP = [list_image_match_LBP ; 1 : total_images ];
        % sap xep theo thu tu giam dan match giua 2 anh
        for i = 1:total_images
             for j = i:total_images
                 if(list_image_match_LBP(1,i) < list_image_match_LBP(1,j))
                    tmp = list_image_match_LBP(1,i);
                    list_image_match_LBP(1,i) = list_image_match_LBP(1,j);
                    list_image_match_LBP(1,j) = tmp;
                    tmp = list_image_match_LBP(2,i);
                    list_image_match_LBP(2,i) = list_image_match_LBP(2,j);
                    list_image_match_LBP(2,j) = tmp;               
                 end
             end    
         end
     end
end

