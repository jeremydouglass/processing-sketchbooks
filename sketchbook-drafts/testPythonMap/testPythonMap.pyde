# forum.processing.org/two/discussion/22301/animating-through-a-for-loop-in-python-mode

import re
index = 0
datalist = []
statecoor = {
    'Alabama': [732, 440],
    'Alaska': [272, 573],
    'Arizona': [260, 393],
    'Arkansas': [620, 402],
    'California': [120, 297],
    'Colorado': [385, 300],
    'Connecticut': [1076, 252],
    'Delaware': [1072, 325],
    'Florida': [853, 546],
    'Georgia': [801, 440],
    'Hawaii': [121, 562],
    'Idaho': [252, 169],
    'Illinois': [671, 273],
    'Indiana': [725, 274],
    'Iowa': [598, 234],
    'Kansas': [512, 313],
    'Kentucky': [756, 326],
    'Louisiana': [624, 484],
    'Maine': [982, 94],
    'Maryland': [989, 340],
    'Massachusetts': [1104, 174],
    'Michigan': [744, 193],
    'Minnesota': [578, 145],
    'Mississippi': [676, 444],
    'Missouri': [616, 317],
    'Montana': [342, 102],
    'Nebraska': [493, 245],
    'Nevada': [196, 258],
    'New Hampshire': [954, 156],
    'New Jersey': [1002, 266],
    'New Mexico': [366, 400],
    'New York': [901, 177],
    'North Carolina': [872, 358],
    'North Dakota': [484, 110],
    'Ohio': [782, 265],
    'Oklahoma': [526, 385],
    'Oregon': [149, 145],
    'Pennsylvania': [865, 232],
    'Rhode Island': [1016, 202],
    'South Carolina': [842, 402],
    'South Dakota': [482, 178],
    'Tennessee': [734, 369],
    'Texas': [494, 481],
    'Utah': [280, 282],
    'Vermont': [932, 144],
    'Virginia': [870, 310],
    'Washington': [180, 65],
    'Wisconsin': [652, 173],
    'West Virginia': [822, 292],
    'Wyoming': [361, 201]

}
sppcolor = {
    'Campylobacter': [204, 114, 62],
    'Clostridium': [86, 204, 62],
    'Escherichia': [255, 114, 103],
    'Listeria': [167, 255, 179],
    'Salmonella': [205, 153, 123]
}

def setup():
    global map_blank
    datafile = open('fooddata_1.txt', 'r')
    map_blank = loadImage('map_blank.jpg')
    
    for line in datafile:
        txt_re = re.search(r'(\d{4}),(\d{1,2}),(\w+\s*\w*),(\w+),(\d+)', line)
        datalist.append([txt_re.group(1), txt_re.group(
            2), txt_re.group(3), txt_re.group(4), txt_re.group(5)])

    background(0)
    size(1280, 688)
    loop()

def draw():
    image(map_blank, 0, 0, width, height)
    elements = datalist[index]
    yr = elements[0]
    mon = int(elements[1])
    state = elements[2]
    species = elements[3]
    num = elements[4]

    noStroke()

    spp = sppcolor[species]
    R = spp[0]
    G = spp[1]
    B = spp[2]
    fill(R, G, B, 125)

    csize = 10 * sqrt(float(num) / 3.1415) # 5 *
    coor = statecoor[state]
    x = coor[0]
    y = coor[1]
    ellipse(x, y, csize, csize)

    fill(255)
    estr = str(yr) + " " + str(mon) + " " + state + " " + species + " " + str(num)
    text(estr, 1000, 600)

def keyPressed(): 
    global index
    if keyCode==RIGHT:
        index = index+1
    if keyCode==LEFT:
        index = index-1
    index = constrain(index, 0, len(datalist)-1)
