module rounded_square(d,r,center=false){
	if (center) {
		minkowski(){
			square([d[0]-2*r,d[1]-2*r], center=center);
			circle(r=r);
		}
	} else {
		translate([r,r])minkowski(){
			square([d[0]-2*r,d[1]-2*r], center=center);
			circle(r=r);
		}
	}
}

module mirror_copy(v = [0, 1, 0]) {
	children();
	mirror(v)children();
}

module rotate_copy(r) {
	children();
	rotate(r)children();
}
