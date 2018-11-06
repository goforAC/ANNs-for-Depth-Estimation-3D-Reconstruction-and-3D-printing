% A file that creates minions by genereating features

function minion = get_minion()

    % The eye generator
    
    eyes = randi([0,1]); % number of eyes is encoded in 0 = one eye and 1 = two eyes
    show_eyes = '0 0 0.45';     % the transform value to show the eyes in the VRML file

    if eyes == 0
        set_eyes = sprintf('one_eye %s', show_eyes);
    elseif eyes == 1
        set_eyes = sprintf('two_eyes %s', show_eyes);
    else
        error('Error: \n Eyes should have the value 0 or 1, not %i', eyes);
    end
    
    % The height generator 
    %   concerning everything depending on the height
    mHeight = randi([1, 10])/10; % 0 < height <= 1  (zero triggers default in VRML which is 1)
    butt = sprintf('0 %i 0', -mHeight/2);
    head = sprintf('0 %i 0', mHeight/2);
    set_height = sprintf('mHeight %i butt %s head %s', mHeight, butt, head); 

    % The arm length generator
    %   concerning everything depending on the arm length
    arm_len = randi([2, 10])/10;
    left_hand = sprintf('0 %i 0', -arm_len/2);
    right_hand = sprintf('0 %i 0', arm_len/2);
    set_arms = sprintf('arm_len %i left_hand %s right_hand %s', arm_len, left_hand, right_hand);

    % The leg length generator
    %   concerning everything regarding the leg length
    leg_len = randi([1, 10])/10;
    shoe_pos = -leg_len/2;
    ankles = sprintf('0 %i 0', shoe_pos);
    feet = sprintf('0 %i 0.1', shoe_pos);
    toes = sprintf('0 %i 0.2', shoe_pos);
    set_legs = sprintf('leg_len %i ankles %s feet %s toes %s', leg_len, ankles, feet, toes);


    minion =  struct('instance',sprintf('\n MinionCreator{%s %s %s %s}', set_eyes, set_height, set_arms, set_legs), 'target', sprintf(' "Eyes" : %i \n "Height" : %i \n "Arm_Length" : %i \n "Leg_Length" : %i', eyes, mHeight, arm_len,leg_len));
end
    