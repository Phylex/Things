$fn = 100;
delta_x = 30;
wall_thickness = 3;
depth = 100;
height = 50;
number_of_trays = 6;
union(){
	for ( i = [0 : number_of_trays-1] ) {
		union(){
			translate([i*delta_x, -height, 0])cube([wall_thickness, height, depth]);
			translate([i*delta_x, 0, 0])cube([delta_x+wall_thickness, wall_thickness, depth]);
			translate([(i+1)*delta_x, -height, 0])cube([wall_thickness, height, depth]);
		}
	}
	screw_tab_delta_x = number_of_trays * delta_x + wall_thickness;
	difference(){
		cube([20, 24, wall_thickness]);
		translate([10, 10 + wall_thickness, wall_thickness/2])cylinder(d=4.5, h=wall_thickness, center=true);
	}
	translate([screw_tab_delta_x-20, 0, 0])difference(){
		cube([20, 24, wall_thickness]);
		translate([10, 10 + wall_thickness, wall_thickness/2])cylinder(d=4.5, h=wall_thickness, center=true);
	}
}
