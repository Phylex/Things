wall_thickness = 2;
pillar_length = 7;
small_pillar_depth = 6;

servo_length = 41;
servo_width = 18;
servo_height = 28;
$fn = 100;
difference(){
	union(){
		cube([servo_width, 65, wall_thickness]);
		translate([0,5,wall_thickness]){
			// the front new pillars
			cube([small_pillar_depth, pillar_length, servo_height]);
			translate([12, 0, 0])cube([small_pillar_depth, pillar_length, servo_height]);
			// the rear pillar
			translate([0, servo_length+pillar_length, 0])cube([servo_width, pillar_length, servo_height]);
		}
	}
	translate([pillar_length/2, 5+small_pillar_depth/2, servo_height-5]){
		cylinder(d=2,h=7);
		translate([11, 0, 0])cylinder(d=2,h=7);
		translate([0, servo_length+pillar_length, 0]){
			cylinder(d=2, h=7);
			translate([11, 0, 0])cylinder(d=2,h=7);
		}
	}
}
