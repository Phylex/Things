$fn=100;
linear_extrude(3)
difference(){
	translate([-110/2, -50])square([110, 50]);
	union(){
		polygon([[-50, 0], [50, 0], [0, -25]]);
		translate([23, -14])circle(d=5);
		translate([-23, -14])circle(d=5);
	}
	translate([30, -50])square([10,10]);
	translate([-40, -50])square([10,10]);
}
