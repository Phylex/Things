volume = 4;
radius = 10;
height = (volume*1000)/(PI*radius*radius);

wall_thickness = 1;
difference(){
	cylinder(r=radius+wall_thickness, h=height+wall_thickness);
	translate([0,0,wall_thickness])cylinder(r=radius, h=height);
}

