
thickness = 3;
pin_diameter = 5;
pin_height = 20+thickness;
plate_width = 10;
pin_offset = 5;
pin_distance = 10;
pin_count = 10;
needle_hole_diameter = 1;
tention_hook_length = 5;
plate_depth = 2*pin_offset+pin_count*(pin_distance+pin_diameter);
$fn = 50;
union(){
	difference(){
		union(){
			cube([plate_depth, plate_width, thickness]);
			for (i = [0:pin_count]) {
				translate([pin_offset+i*(pin_distance+pin_diameter), plate_width/2, 0])cylinder(d=pin_diameter, h=pin_height);
			}
		}
		translate([0, plate_width/2, pin_height-needle_hole_diameter-1])rotate([0, 90, 0])cylinder(d=needle_hole_diameter, h=plate_depth);
		translate([0, plate_width/2, pin_height-needle_hole_diameter-1-7])rotate([0, 90, 0])cylinder(d=needle_hole_diameter, h=plate_depth);
	}
	translate([-tention_hook_length, 0, 0])difference(){
		cube([tention_hook_length, tention_hook_length, thickness]);
		translate([tention_hook_length/2-.5, 0, 0])cube([1, tention_hook_length, 1]);
	}
	translate([plate_depth, 0, 0])difference(){
		cube([tention_hook_length, tention_hook_length, thickness]);
		translate([tention_hook_length/2-.5, 0, 0])cube([1, tention_hook_length, 1]);
	}
}
