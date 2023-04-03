clc
clear 
close all
addpath('Method');
Image_dir = 'Image';
listing = cat(1, dir(fullfile(Image_dir, 'im', '*.jpg')));
% The final output will be saved in this directory:
result_dir = fullfile(Image_dir, 'result');
% Preparations for saving results.
if ~exist(result_dir, 'dir'), mkdir(result_dir); end

for i_img = 1:length(listing)
    Input = imread(fullfile(Image_dir, 'im', listing(i_img).name));
    [~, img_name, ~] = fileparts(listing(i_img).name);
    img_name = strrep(img_name, '_input', ''); 
    Out1 = LACC(Input);    
    Result = (LACE(Out1));
    imwrite(Result, fullfile(result_dir, [img_name, '_MLLE.jpg'])); 
end


