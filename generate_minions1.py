# A file that creates minions by genereating features

import random 

def get_minion():
    # The eye generator
    eyes = random.randint(0,1) # number of eyes is encoded in 0 = one eye and 1 = two eyes
    show_eyes = '0 0 0.45'      # the transform value to show the eyes in the VRML file

    if(eyes == 0):
        set_eyes = 'one_eye {}'.format(show_eyes)
    elif(eyes == 1):
        set_eyes = 'two_eyes {}'.format(show_eyes)
    else:
        raise ValueError('eyes should have the value 0 or 1')

    # The height generator 
    #   concerning everything depending on the height
    mHeight = random.randrange(1, 10)/10 # 0 < height <= 1  (zero triggers default in VRML which is 1)
    butt = '0 {} 0'.format(-mHeight/2)
    head = '0 {} 0'.format(mHeight/2)
    set_height = 'mHeight {} butt {} head {}'.format(mHeight, butt, head) 

    # The arm length generator
    #   concerning everything depending on the arm length
    arm_len = random.randrange(2, 10)/10
    left_hand = '0 {} 0'.format(-arm_len/2)
    right_hand = '0 {} 0'.format(arm_len/2)
    set_arms = 'arm_len {} left_hand {} right_hand {}'.format(arm_len, left_hand, right_hand)

    # The leg length generator
    #   concerning everything regarding the leg length
    leg_len = random.randrange(1, 10)/10
    shoe_pos = -leg_len/2
    ankles = '0 {} 0'.format(shoe_pos)
    feet = '0 {} 0.1'.format(shoe_pos)
    toes = '0 {} 0.2'.format(shoe_pos)
    set_legs = 'leg_len {} ankles {} feet {} toes {}'.format(leg_len, ankles, feet, toes)


    return "MinionCreator{{{} {} {} {}}}".format(set_eyes, set_height, set_arms, set_legs)