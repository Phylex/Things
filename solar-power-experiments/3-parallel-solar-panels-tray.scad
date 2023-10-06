solar_panel_x = 20.5;
solar_panel_y = 53;
separator_width = 1;

parallel_group_count = 3;
series_group_count = 3;

center_tap_y = solar_panel_y / 2;
top_support_hole_y = 3 * solar_panel_y / 4;
bottom_support_hole_y = solar_panel_y /4;
edge_offset = 5;
center_tap_groove_width = 2;

difference(){

linear_extrude(2)
translate([-separator_width, -separator_width])
square([parallel_group_count*solar_panel_x + 2 * separator_width, solar_panel_y + 2 * separator_width]);
union(){
translate([0, 0, 1])
linear_extrude(1)
square([parallel_group_count*solar_panel_x, solar_panel_y]);

translate([0, center_tap_y, 0.3])
cube([solar_panel_x * parallel_group_count, center_tap_groove_width, 1]);

translate([0, center_tap_y])
cube([2,2,2]);
translate([parallel_group_count * solar_panel_x, center_tap_y, 0])
cube([1,2,2]);
}
translate([edge_offset, bottom_support_hole_y - 1])
cube(2,2,2);

translate([edge_offset, top_support_hole_y - 1])
cube(2,2,2);

translate([parallel_group_count * solar_panel_x - 2 - edge_offset, top_support_hole_y - 1])
cube(2,2,2);
translate([parallel_group_count * solar_panel_x - 2 - edge_offset, bottom_support_hole_y - 1])
cube(2,2,2);
}