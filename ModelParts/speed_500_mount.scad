mounting_hole_distance = 25;
motor_diameter = 36;
shaft_protrusion_diameter = 13;
shaft_protrusion_height = 4.6;
shaft_diameter = 3.2;
motor_length = 50;
wall_thickness = 2;

base_plate_length = motor_length * 1.2;
base_plate_width = motor_diameter * 1.2;
mounting_hole_hight = motor_diameter /2;

lichtschranke_platine_laenge = 33;
lichtschranke_platine_breite = 11;
lichtschranke_boden_clearance = 15;
lichtschranke_stecker_laenge = 6;

$fn = 100;
union(){
cube([base_plate_length, base_plate_width, wall_thickness]);
rear_side_plate_start = base_plate_length * 0.9;
side_plate_height = 15 + 20;

translate([0, wall_thickness, wall_thickness])rotate([90, 0, 0])linear_extrude(wall_thickness)polygon([[0, 0], [rear_side_plate_start, 0], [wall_thickness, side_plate_height], [0, side_plate_height]]);
translate([0, base_plate_width, wall_thickness])rotate([90, 0, 0])linear_extrude(wall_thickness)polygon([[0, 0], [rear_side_plate_start, 0], [wall_thickness, side_plate_height], [0, side_plate_height]]);
translate([0, base_plate_width/2, wall_thickness])rotate([0, 0, 90])rotate([90, 0, 0])difference(){
	union(){
		translate([0, side_plate_height, 0])cylinder(h=wall_thickness, d=motor_diameter);
		translate([-base_plate_width/2, 0, 0])cube([base_plate_width, side_plate_height, wall_thickness]);
	}
	union(){
	translate([0, side_plate_height, 0])cylinder(h=wall_thickness, d=shaft_protrusion_diameter);
	translate([- mounting_hole_distance/2, side_plate_height, 0])cylinder(h=wall_thickness, d=4.5);
	translate([+ mounting_hole_distance/2, side_plate_height, 0])cylinder(h=wall_thickness, d=4.5);
	}
}
translate([-lichtschranke_platine_laenge + lichtschranke_stecker_laenge, base_plate_width/2 - lichtschranke_platine_breite/2, 0])
	cube([lichtschranke_platine_laenge - lichtschranke_stecker_laenge, lichtschranke_platine_breite, lichtschranke_boden_clearance]);
}
