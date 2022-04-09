module corner (thickness, width, depth, height, angle, with_top=true, top_width=3) {
	reduced_width = width-tan(angle)*depth;
	outer_length = sqrt(pow(depth,2)+pow(height,2));
	thickness_offset=tan(angle)*thickness;
	union(){
		difference(){
			linear_extrude(height=height, convexity=2)
				polygon(points=[[0, 0], [width, 0], [reduced_width, depth], [0, depth]]);
			linear_extrude(height=height, convexity=2)
				polygon(points=[[0, thickness], [width-thickness-thickness_offset, thickness], [reduced_width-thickness-thickness_offset, depth], [0, depth]]);
		}
		linear_extrude(height=thickness, convexity=2)
			polygon(points=[[0, 0], [width, 0], [reduced_width, depth], [0, depth]]);
		translate([0,0,height-thickness])
			linear_extrude(height=thickness, convexity=2)
				polygon(points=[[width, 0], [reduced_width, depth], [reduced_width-top_width, depth], [width-top_width, 0]]);
	}
}
