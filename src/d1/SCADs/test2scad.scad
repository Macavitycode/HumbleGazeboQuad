
$fa = 2;
$fs = 0.25;

n_belos = 7;
t_belos = 2;
d_belos = 12;
len_bel = 98;
end_wid = 1;
tot_len = len_bel + 2 * end_wid;
tot_wid = 20;


points = [
    for (a = [0:n_belos * 2])
        [ end_wid + (len_bel/n_belos) * a/2, 
            a % 2 == 0 ? 
            ((tot_wid/2 + t_belos) - d_belos)
        :   -((tot_wid/2) - t_belos)
        ],    
];
    
inner_points = [[end_wid, tot_wid/2 + 1], 
                each points, 
                [tot_len - end_wid, tot_wid/2 + 1]];

offset_points = [for (p = points) [p[0], p[1] - t_belos]];
    
outer_points = [[0 - 1, -(tot_wid/2 + 1)], [0 - 1, (tot_wid/2 - d_belos)],
                each offset_points,
                [tot_len + 1, (tot_wid/2 - d_belos)], [tot_len + 1, -(tot_wid/2 + 1)]];

echo(outer_points);

rotate_extrude()
rotate([0,0,90]) translate([0, -tot_wid/2, 0])
difference() {
    translate([tot_len/2, 0, 0]) square([tot_len, tot_wid], center = true);
    union() {
        polygon(inner_points);
        polygon(outer_points);
    } // End of Union
} // End of Difference
        