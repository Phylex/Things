motor_y = 10;
motor_x = 12;
screw_delta_x = 9;
screw_y = motor_y/2;
screw_z = 5;
screw_diameter = 1.5;
motor_z = 30;
motor_gear_diameter = 3;
motor_gear_z = 7.3;
motor_gear_base_diameter = 4;
motor_gear_base_z = 0.7;
motor_gear_nook_depth = 0.7;
$fn = 100;

wall_width = 2;
module motor() {
	difference() {
		cube([motor_x, motor_y, motor_z]);
		//translate([(motor_x-screw_delta_x)/2, screw_y, motor_z-screw_z]){
		//	cylinder(d=screw_diameter, h=screw_z);
		//	translate([screw_delta_x, 0, 0])
		//		cylinder(d=screw_diameter, h=screw_z);
		//}
	}
	translate([motor_x/2, motor_y/2, motor_z])
		cylinder(d=motor_gear_base_diameter, h=motor_gear_base_z);
	translate([motor_x/2, motor_y/2, motor_z+motor_gear_base_z])
		difference() {
			cylinder(d=motor_gear_diameter, h=motor_gear_z);
			//translate([motor_gear_diameter/2-motor_gear_nook_depth, -motor_gear_diameter/2, 0])
				//cube([motor_gear_nook_depth, motor_gear_diameter, motor_gear_z]);
		}
}

rotate([-90, 0, 0])
color("white")difference() {
	cube([motor_x+2*wall_width, motor_y+wall_width, motor_z+2*wall_width]);
	color("lightgray")translate([wall_width, 0, wall_width])motor();
	translate([wall_width, 0, motor_z+wall_width]){
		translate([(motor_x-screw_delta_x)/2, screw_y, 0]) {
			cylinder(d=screw_diameter, h=wall_width);
			translate([screw_delta_x, 0, 0])
				cylinder(d=screw_diameter, h=wall_width);
		}
	}
}

