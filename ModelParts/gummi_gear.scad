or = 5;
ir = 3.5;
h = 4;
$fn = 30;
profile = [[0, 0], [or, 0], [ir, h/2], [or, h], [0, h]];

rotate_extrude(angle=365)polygon(profile);
