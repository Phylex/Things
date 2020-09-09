cell_length = 65;
cell_diameter = 18;
cell_radius = cell_diameter/2;
wall_thickness = 3;
solder_space = 7;
spacing = 16;
height = wall_thickness+cell_radius;
module _18650() {
color("lightgreen")
translate([cell_radius, 0, cell_radius])rotate([270,0,0])cylinder(cell_length, d=cell_diameter);
}
difference(){
	cube([2*wall_thickness+cell_diameter,
		  2*wall_thickness+1*solder_space+1*cell_length,
		  height
	]);
	translate([wall_thickness, wall_thickness, wall_thickness]){
		_18650();
		translate([0, cell_length, 0])cube([cell_diameter, solder_space+wall_thickness, height-wall_thickness]);
	}
}
