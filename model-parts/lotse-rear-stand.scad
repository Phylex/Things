$fn=100;
linear_extrude(3)
difference(){
	translate([-120/2, -50])square([120, 50]);
	union(){
		polygon([[-58, 0], [58, 0], [0, -16]]);
		translate([31, -8])circle(d=5);
		translate([-31, -8])circle(d=5);
		translate([0, -21])circle(d=12);
		translate([0, -16])square([12,10], center=true);
	}
	translate([30, -50])square([10,10]);
	translate([-40, -50])square([10,10]);
}
