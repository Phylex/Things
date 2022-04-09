width = 10;
thickness = 3;
difference(){
	union(){
		cylinder( thickness ,width/2, width/2, center=true, $fn=40);
		translate([width/2, 0, 0])cube([width, width, thickness], center=true);
	};
	cylinder( 2*thickness, 2, 2, center=true, $fn=20);
};
