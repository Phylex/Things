servo_x = 22.6;
servo_y = 13;
servo_z = 23.5;
servo_mount_x = 32.5;
servo_mount_z = 1.7;
servo_mount_y = servo_y;
servo_mount_clearance = 17;
servo_arm_x = 10;
servo_arm_y = servo_y/2;
servo_arm_z = 5;
servo_arm_diameter = 6;
servo_arm_thickness = 2;
servo_arm_length = 19;
mounting_hole_offset_x = 2;
mounting_hole_diameter = 2;
wall_thickness = 2;
use <../lib/utils.scad>;
$fn = 10;
module servo_9g_arm() {
	color("white")rotate([0, 0, 90])union() {
	cylinder(d=servo_arm_diameter, h=servo_arm_z);
	translate([servo_arm_length/2-2.9, 0, servo_arm_z-servo_arm_thickness])
	linear_extrude(servo_arm_thickness)
		rounded_square([servo_arm_length, servo_arm_diameter], 2.9, center=true);
	}
}

module servo_9g() {
	color("gray"){
	translate([(servo_mount_x-servo_x)/2, 0, 0])cube([servo_x, servo_y, servo_z]);
	translate([0, 0, servo_mount_clearance])cube([servo_mount_x, servo_mount_y, servo_mount_z]);
	}
	translate([servo_arm_x, servo_arm_y, servo_z])servo_9g_arm();
}
rotate([-90, 0, 0])
difference() {
cube([servo_mount_x, servo_y+wall_thickness, servo_z]);
translate([0, 0, wall_thickness]) servo_9g();
translate([mounting_hole_offset_x, servo_y/2, servo_mount_clearance]){
	cylinder(d=mounting_hole_diameter, h=10, center=false);
	translate([servo_mount_x-2*mounting_hole_offset_x, 0, 0])
	cylinder(d=mounting_hole_diameter, h=10, center=false);
}
}
