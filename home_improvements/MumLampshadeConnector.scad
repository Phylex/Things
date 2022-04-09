tooth_width = 3;
tooth_height = 20;
base_height = 10;
base_width = 10;
$fn = 100;
module connector(tooth_width, tooth_height, base_width, base_height) {
	corner_offset = (base_width-tooth_width)/2;
	height_offset = tooth_height/2+base_height/2;
	corner_positions = [
		[corner_offset, corner_offset, 0],
		[corner_offset, -corner_offset, 0],
		[-corner_offset, corner_offset, 0],
		[-corner_offset, -corner_offset, 0]
		];
	difference(){
		union(){
			for (i=[-1:2:1]) {
				for (j=[0:1:3]){
					translate([0, 0, i*height_offset])
						translate(corner_positions[j])
							cube([tooth_width, tooth_width, tooth_height], center=true);
				}
			}
			//teeth top
			//base
			cube([base_width, base_width, base_height], center=true);
		}
		cylinder(r=(base_width-2*tooth_width)/2, h=base_height, center=true);
	}
}

union(){
	connector(tooth_width, tooth_height, base_width, base_height);
	rotate([90, 0, 0])connector(tooth_width,tooth_height, base_width,base_height);
	rotate([0, 90, 0])connector(tooth_width,tooth_height, base_width,base_height);
}

