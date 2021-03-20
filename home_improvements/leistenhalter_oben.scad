sections_width = 5;
sections_depth = 5;
swidth = 30;
sdepth = 30;
sheight = 10;
wallthickness = 2;
box_width = swidth + 2 * wallthickness;
box_depth = sdepth + 2 * wallthickness;
box_height = sheight + wallthickness;
$fn = 100;

module holding_structure(width, depth, height, baseheight) {
	traegerpolygon = [[0,0], [depth,0], [depth, baseheight], [wallthickness, height], [0, height]];
	backplane_width = swidth + 2 * wallthickness;
	difference() {
	union() {
	translate([0, -swidth/2 , 0])rotate([90, 0, 0])linear_extrude(wallthickness)polygon(traegerpolygon);
	translate([0, swidth/2 + wallthickness, 0])rotate([90, 0, 0])linear_extrude(wallthickness)polygon(traegerpolygon);
	translate([0, -backplane_width/2, 0])cube([wallthickness, backplane_width, height]);
	}
	translate([0, 0, 1.2*sheight])rotate([0, 90, 0])cylinder(r=2, h=2);
	translate([0, 0, 2.2*sheight])rotate([0, 90, 0])cylinder(r=2, h=2);
	}
}

module box_both_open(outside_width, outside_depth, outside_height, wallthickness) {
	difference() {
	cube([outside_width, outside_depth, outside_height]);
	translate([wallthickness, wallthickness, 0])cube([outside_width - 2 * wallthickness, outside_depth - 2 * wallthickness, outside_height]);
	}
}
difference() {
union() {
holding_structure(swidth, 2 * sdepth, 3 * sheight, sheight);
for ( i = [0:sections_width-1] ) {
	for ( j = [0:sections_depth-1] ) {
		translate([(i)*(box_width-wallthickness), (j-2)*(box_depth-wallthickness), 0])
			translate([0, -box_width/2, 0])box_both_open(box_width, box_depth, box_height, 2);
	}
}
}
translate([0, 0, 1.2*sheight])rotate([0, 90, 0])cylinder(r=2, h=2);
}
