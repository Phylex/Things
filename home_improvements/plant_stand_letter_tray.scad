inner_width=274;
main_tube_diameter=10;
aux_tube_diameter=8.5;
main_tube_usable_len=60;

wall_thickness = 3;
plate_diamiter = 90;
clip_dimensions = [10, 12, 14];
$fn = 100;
//this is the tube assembly that Ill be placing the clips on (a rough model of the Ikea DOKUMENT)
color("lightgray")translate([0, 0, -main_tube_diameter/2])union(){
	rotate([0, 90, 0])cylinder(d=aux_tube_diameter, inner_width+main_tube_diameter, center=true);
	for (i = [-1, 1]){
		translate([(inner_width+main_tube_diameter)/2*i, 0, 0])rotate([90, 0, 0])cylinder(d=main_tube_diameter, main_tube_usable_len, center=true);
	}
}

//this is the thing I'd actually want to print
!color("white")translate([0, 0, clip_dimensions[1]-9])union(){
	cylinder(d=plate_diamiter, wall_thickness);
	translate([0, 0, wall_thickness/2])braced_panel([inner_width+2*main_tube_diameter, main_tube_usable_len, wall_thickness], 11);
	for ( i = [[1, 1], [1, -1], [-1, 1], [-1, -1]] ) {
		translate([(inner_width+main_tube_diameter)*i[0]/2, (main_tube_usable_len-clip_dimensions[1])*i[1]/2, 0])
			rotate([0, 180, 90])
				clip_to_cylinder(clip_dimensions, 5, 1);
	}
	rotate([180,0,0])clip_to_cylinder([10,aux_tube_diameter+1,14-(main_tube_diameter-aux_tube_diameter)+0.25], 4.25, 1);
}
//this is the braced structure that ill be using to strut the holding plate
module braced_panel ( dim, brace_width ) {
	x = dim[0];
	y = dim[1];
	z = dim[2];
	echo(x);
	echo(y);
	echo(z);
	intersection(){
		cube(dim, center=true);
		union(){
			difference(){
				cube(dim, center=true);
				cube([dim[0]-2*brace_width, dim[1]-2*brace_width, dim[2]], center=true);
			}
			rotate([0, 0, atan(y/x)])cube([sqrt(pow(x,2)+pow(y,2)), brace_width, z], center=true);
			rotate([0, 0, -atan(y/x)])cube([sqrt(pow(x,2)+pow(y,2)), brace_width, z], center=true);
		}
	}
}
module clip_to_cylinder (dim, rad, overhang) {
	x = dim[0];
	y = dim[1];
	z = dim[2];
	cube_height = z-(y/2);
	cut_height = y;
	difference(){
		union(){
			translate([0, 0, cube_height/2])cube([x, y, cube_height], center=true);
			translate([0, 0, cube_height])rotate([0,90,0])cylinder(d=y, x, center=true);
		}
		translate([0, 0, cube_height])rotate([0, 90, 0])cylinder(r=rad, x, center=true);
		translate([0, 0, cube_height+cut_height/2])cube([x, 2*rad-overhang, cut_height], center=true);
	}
}
//!clip_to_cylinder([10, 12, 14], 5, 1);
