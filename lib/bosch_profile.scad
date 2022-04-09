use <./utils.scad>
lk_kern = 9;
t_nut = 11/2;
b_nut = 7;
s_breite = 6;
wandstaerke = 2;
$fn=100;

module bosh2020_6(l) {
	linear_extrude(height=l, center=true,convexity=8) {
		difference(){
			rouded_square([20,20],2,center=true);
			circle(r=5.5/2, center=true);
			for (i= [0:3]){
				rotate([0, 0, i*90])translate([0, -t_nut-lk_kern/2])mirror_copy(v=[1,0,0])polygon(points=[[0,0],[s_breite/2,0],[s_breite/2,wandstaerke],[6,wandstaerke],[6,3],[b_nut/2,t_nut], [0,t_nut]]);
			}
		}
	}
}
