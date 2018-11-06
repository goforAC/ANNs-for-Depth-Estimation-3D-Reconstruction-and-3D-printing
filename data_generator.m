% Open the minion template once
template_filename = 'minion_template.wrl';
minion_template = fileread(template_filename);
temp_file = 'temporary_minion.wrl';


% start data generation
for n = 501:2000
    % create instance
    minion = get_minion();
    this_minion = strcat(minion_template, minion.instance);
    
    % save instance temporary
    fileID1 = fopen(temp_file,'w');
    fprintf(fileID1, '%s ', this_minion);
    fclose(fileID1);
    
    % save target
    fileID2 = fopen(strcat('./simple_minion_dataset/targets/target',num2str(n),'.txt'),'w');
    fprintf(fileID2, '%s', minion.target);
    fclose(fileID2);
    
    % create instance image on a canvas
    this_world = vrworld(temp_file, 'new');
    open(this_world);
    canvas = view(this_world);
    set(canvas, 'ZoomFactor', 2);
        
    % crop and process (as you like) and save instance image
    image = capture(canvas);
    cropped_image = image(80:379,210:509,:); %crop
    resized_image = imresize(cropped_image, [100 100]);
    imwrite(double(resized_image)/255, strcat('./simple_minion_dataset/data/minion',num2str(n),'.png'), 'png', 'transparency', double(resized_image(1,1,:))/255);  
    
    close(canvas);
    close(this_world);
    delete temporary_minion.wrl;
end

