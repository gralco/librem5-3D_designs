
// x,y,z dimensions
// t thickness of frame
// d screw dome diameter
// dh screw dome height
module case_outline(x,y,z,t,d,dh) {
    union () {
        difference() {
            cube ([x, y, z], center=false);
            translate([t,t,(t/2)]) {
                cube ([x-2*t, y-2*t, z], center=false);
            };
        }
        translate([d,d,0]) {
            cylinder (h=dh,r=d,center=false);
        }
        translate([x-d,d,0]) {
            cylinder (h=dh,r=d,center=false);
        }
        translate([d,y-d,0]) {
            cylinder (h=dh,r=d,center=false);
        }
        translate([x-d,y-d,0]) {
            cylinder (h=dh,r=d,center=false);
        }
    }
}

case_outline(72,135,15,1,3,13);

