/* 
   This is based on a design by mrpickle
   https://www.youmagine.com/designs/librem5-devkit-case
*/

//import("case-withhole.stl");

base=3;
wall=2.5;
inset=5;

d=92;
w=181;
h=21 + inset;

$fn=60;

module half( h, d, a ) {
    color( "red" )
    rotate([0,0,a])
        difference() {
            cylinder( h, d=d, true );
            union() {
                translate([ -d/2, -d, -1 ]) 
                    cube([d, d,h+2]);
            }
        }
}

module quarter( h, d, a ) {
    color( "red" )
    rotate([0,0,a])
        difference() {
            cylinder( h, d=d, true );
            union() {
                translate([ -1, -d, -1 ]) 
                    cube([d, d,h+2]);
                translate([ -d, -d/2, -1 ]) 
                    cube([d, d,h+2]);
            }
        }
}

translate([1,1,base])
quarter(h-5, 23, 0);
translate([ w+wall, wall, base] )
    quarter(h-8, 23, 90);
translate([ 170 + wall, d+wall, base] )
    half(h-5, 17, 180);
translate([ wall, d+wall, base] )
    quarter(h-5, 18, 270);

color( "red" )
    difference() {
        minkowski() {
            items = 2;
            translate([0, 0, 0])
                cylinder( d=wall, base, true);
            translate([wall-1, wall-1, 0])
                cube( [w+2, d+2, h ] );
        };
 
        union() {
            // devkit cutout
            translate([wall,wall,base])
                cube( [w, d, h+1 ] );

            //switches
            translate([47+wall,d+wall/2,h-5+base])
                cube( [51, 4, 5 ] );

            // Smart card
            translate([18+wall,-1,h-8+base])
                cube( [20, 4, 4 ] );

            // Push buttons
            translate([80+wall,-1,h-6+base])
                cube( [4.5, 2*wall, 2] );
            translate([96.5+wall,-1,h-6+base])
                cube( [4.5, 2*wall, 2] );
            translate([117+wall,-1,h-6+base])
                cube( [4.5, 2*wall, 2] );

            // SIM card
            translate([136+wall,-1,h-6+base])
                cube( [16, 2*wall, 4] );

            // bottom - hdmi, usb, SD card
            translate([-1,10+wall,h-9+base])
                cube( [wall*2, 70, 5 ] );
            // ethernet
            translate([-1,51+wall,h-18+base])
                cube( [wall*2, 18, 9 ] );
            // audio
            translate([-1,68+wall,h-11+base])
                cube( [wall*2, 14, 8 ] );

            // heatsink
            translate([90,35,-1])
                cylinder( 2*base, d=33, true );

            // debug
            translate([113.25,2*wall+1.75,-1])
                cylinder( 2*base, d=6, true);
            translate([105,2*wall,-1])
                cube( [16.5, 3.5, 2*base]);

        }
    }
