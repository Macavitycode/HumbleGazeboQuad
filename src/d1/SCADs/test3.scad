use <bladegen/bladegen.scad>

$fa = 2;
$fs = 0.25;

INCH_MM = 25.4;

n_blades = 3;
p_ccw = true;
p_rad = 3;

h_height = 6.5;
h_r1 = 6;
h_r2 = 6;

hole_r = 4;

difference() {
    union() {

        cylinder(h_height, h_r1, h_r2, center = true);
        
        for(i = [0:360/n_blades:360-1]){
             rotate([0, 0, i])  translate([0, -2, 1.5])
            bladegen(pitch = 20, diameter = p_rad * INCH_MM, outline = rectangular_outline(), ccw = p_ccw);
        }

    }
    
    union() {
        cylinder(h_height + 10, r = hole_r, center = true);
        translate([0, 0, -(5 + h_height/2) ]) cylinder(10, r = h_r1, center = true);
    }
}