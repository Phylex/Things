use <utils.scad>
module bosch_2020_6_corner() {
	length = 38;
	thickness = 3;
	height = 17;
	hole_length = 9.5;
	hole_height = 5;
	z_hole_offset = 6;
	x_offset_first_hole = 7;
	dhole = 8;
	x_offset_second_hole = x_offset_first_hole + hole_length + dhole;
	union(){
		difference(){
			cube([length, thickness, height]);
			translate([x_offset_first_hole, 0, z_hole_offset])
				translate([0, thickness, 0])
					rotate([90, 0, 0])
						linear_extrude(thickness)
							rouded_square([hole_length, hole_height], 1, center=false);
			translate([x_offset_second_hole, 0, z_hole_offset])
				translate([0, thickness, 0])
					rotate([90, 0, 0])
						linear_extrude(thickness)
							rouded_square([hole_length, hole_height], 1, center=false);
		}

		translate([thickness, 0, 0])
		rotate([0, 0, 90])
		difference(){
			cube([length, thickness, height]);
			translate([x_offset_first_hole, 0, z_hole_offset])
				translate([0, thickness, 0])
					rotate([90, 0, 0])
						linear_extrude(thickness)
							rouded_square([hole_length, hole_height], 1, center=false);
			translate([x_offset_second_hole, 0, z_hole_offset])
				translate([0, thickness, 0])
					rotate([90, 0, 0])
						linear_extrude(thickness)
							rouded_square([hole_length, hole_height], 1, center=false);
		}

		linear_extrude(thickness)
			polygon([[thickness,thickness], [length, thickness], [thickness, length]]);
	}
}

bosch_2020_6_corner();
