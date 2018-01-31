$fn=60;

// x,y,z dimensions
// t thickness of frame
// d screw dome diameter
// dh screw dome height
module case_outline(x,y,z,t,d,dh) {
//    union () {
        difference() {
            // outer frame
            translate([2,2,0]) {
            minkowski() {
                    cube ([x-3, y-3, z], center=false);
                    cylinder(r=2,h=0.1);
                }
            }
            // 1mm sink frame for top glass
            translate([t,t, z-1]) {
                cube ([x-t, y-t, 4], center=false);
            };
            // 2mm sink frame for display
            translate([4+t,4+t, z-3]) {
                cube ([x-8, y-8, 4], center=false);
            };
            // holding bars, left to right
            translate([4+t,4+t, z-4]) {
                cube ([x-8, y-120, 4], center=false);
            };
            translate([4+t,35+t, z-4]) {
                cube ([x-8, y-90, 4], center=false);
            };
            translate([4+t,90+t, z-4]) {
                cube ([x-8, y-100, 4], center=false);
            };

            // bottom hole
            translate([t,t, -.5]) {
                cube ([x-t, y-t, 12], center=false);
            };

        }


        // mounting domes for the back cover
        translate([d,d,1]) {
            cylinder (h=dh,r=d,center=false);
        }
        translate([x-d+t,d,1]) {
            cylinder (h=dh,r=d,center=false);
        }
        translate([d,y-d,1]) {
            cylinder (h=dh,r=d,center=false);
        }
        translate([x-d+t,y-d,1]) {
            cylinder (h=dh,r=d,center=false);
        }

        translate([x-d+t,(y/3)-d,1]) {
            cylinder (h=dh,r=d,center=false);
        }
        translate([x-d+t,2*(y/3)-d,1]) {
            cylinder (h=dh,r=d,center=false);
        }

        translate([d,(y/3)-d,1]) {
            cylinder (h=dh,r=d,center=false);
        }
        translate([d,2*(y/3)-d,1]) {
            cylinder (h=dh,r=d,center=false);
        }

//    }

}

case_outline(80,143,15,1,2.5,10.5);

