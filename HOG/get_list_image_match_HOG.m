function [list_image_match_hist_HOG, filenames] = get_list_image_match_HOG(path_images, EUCLID)
% Kiem tra anh tu duong dan path_images theo khoang cach Euclid hoac Cosine
% co match voi anh nao trong tap data nguon khong
        
     % tinh color_ histogram cua anh dau vao 
     images = imread(path_images);
     mask_grad_x = [-1 -1 -1 ; 2 2 2 ; -1 -1 -1];
     mask_grad_y = [-1 2 -1 ; -1 2 -1 ; -1 2 -1];
     G = fspecial('gaussian',[5 5],2);
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
     % tinh color histogram cua anh nguon
     [mt_hist_HOG_dataset, filenames] = get_hist_HOG_dataset();
     total_images = numel(filenames);
     list_image_match_hist_HOG = mt_hist_HOG_dataset;
     if(EUCLID)
        %tinh khoang cach Euclid
        list_image_match_hist_HOG = mt_hist_HOG_dataset - image_hist_hog;
        list_image_match_hist_HOG = list_image_match_hist_HOG.^2;
        list_image_match_hist_HOG = sum(list_image_match_hist_HOG);
        list_image_match_hist_HOG = sqrt(list_image_match_hist_HOG);
        list_image_match_hist_HOG = [list_image_match_hist_HOG ; 1 : total_images ];
        % sap xep theo thu tu giam dan match giua 2 anh
        for i = 1:total_images
             for j = i:total_images
                 if(list_image_match_hist_HOG(1,i) > list_image_match_hist_HOG(1,j))
                    tmp = list_image_match_hist_HOG(1,i);
                    list_image_match_hist_HOG(1,i) = list_image_match_hist_HOG(1,j);
                    list_image_match_hist_HOG(1,j) = tmp;
                    tmp = list_image_match_hist_HOG(2,i);
                    list_image_match_hist_HOG(2,i) = list_image_match_hist_HOG(2,j);
                    list_image_match_hist_HOG(2,j) = tmp;               
                 end
             end    
        end
     else
        % Do khoang cach Cosine
        list_image_match_hist_HOG = sum(list_image_match_hist_HOG.*image_hist_hog)./sqrt(sum(list_image_match_hist_HOG.^2)*sum(image_hist_hog.^2));
        list_image_match_hist_HOG = [list_image_match_hist_HOG ; 1 : total_images ];
        % sap xep theo thu tu giam dan match giua 2 anh
        for i = 1:total_images
             for j = i:total_images
                 if(list_image_match_hist_HOG(1,i) < list_image_match_hist_HOG(1,j))
                    tmp = list_image_match_hist_HOG(1,i);
                    list_image_match_hist_HOG(1,i) = list_image_match_hist_HOG(1,j);
                    list_image_match_hist_HOG(1,j) = tmp;
                    tmp = list_image_match_hist_HOG(2,i);
                    list_image_match_hist_HOG(2,i) = list_image_match_hist_HOG(2,j);
                    list_image_match_hist_HOG(2,j) = tmp;               
                 end
             end    
         end
     end
end

