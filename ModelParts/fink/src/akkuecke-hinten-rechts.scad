use <../lib/ecke.scad>

thickness = 1.5;
height = 21;
depth = 20;
width = 10;
angle = 3.084;

mirror([1,0,0])rotate([0,90,0])rotate([0, 0, -angle])corner(thickness, width, depth, height, angle);
