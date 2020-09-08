cell_length = 65;
cell_diameter = 18;
cell_radius = cell_diameter/2;
wall_thickness = 3;
solder_space = 7;
spacing = 16;
height = 12;
module _18650() {
color("lightgreen")
translate([cell_radius, 0, cell_radius])rotate([270,0,0])cylinder(cell_length, d=cell_diameter);
}
difference(){
	cube([2*(wall_thickness+cell_diameter)+wall_thickness,
		  4*wall_thickness+2*solder_space+2*cell_length+spacing,
		  height
	]);
	// translate everything within the box-walls
	translate([wall_thickness, wall_thickness, wall_thickness]){
		cube([2*cell_diameter+wall_thickness, solder_space, height-wall_thickness]);
		translate([0, solder_space, 0]){
			_18650();
			translate([wall_thickness+cell_diameter, 0, 0])_18650();
			translate([0, cell_length, 0]){
				translate([0, 0, wall_thickness])cube([2*cell_diameter+wall_thickness, spacing+2*wall_thickness, height-2*wall_thickness]);
				translate([0, wall_thickness, 0])cube([2*cell_diameter+2*wall_thickness, spacing, height-wall_thickness]);
			}
			translate([0, cell_length+wall_thickness+spacing+wall_thickness, 0]){
				_18650();
				translate([wall_thickness+cell_diameter, 0, 0])_18650();
				translate([0, cell_length, 0]){
					cube([2*cell_diameter+wall_thickness, solder_space, height-wall_thickness]);
				}
			}
		}
	}
}
