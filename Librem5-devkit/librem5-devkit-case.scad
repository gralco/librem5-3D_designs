/* 
   This is based on a design by mrpickle
   https://www.youmagine.com/designs/librem5-devkit-case
*/

//import("case.stl");

base=3;
wall=2.5;

d=91;
w=180;
h=30;

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
quarter(25, 23, 0);
translate([ w+wall, wall, base] )
    quarter(22, 23, 90);
translate([ 170 + wall, d+wall, base] )
    half(25, 17, 180);
translate([ wall, d+wall, base] )
    quarter(25, 18, 270);

/*
color( "green" )
            translate([0,wall,wall/2])
            rotate([-90, 0,0])
                cylinder( d=wall, 2, true);
            translate([wall,0,wall/2])
            rotate([0, 90,0])
                cylinder( d=wall, 2, true);
*/
color( "red" )
    difference() {
        minkowski() {
            items = 2;
/*            
            translate([0,0,-wall/2])
            rotate([-90, 0,0])
                cylinder( d=wall, 2, false);
            translate([0,0,0])
            rotate([0, 90,0])
                cylinder( d=wall, 2, false);
*/
            translate([0, 0, 0])
                cylinder( d=wall, base, true);
            translate([wall-1, wall-1, 0])
                cube( [w+2, d+2, h ] );
        };
        
        union() {
            // devkit cutout
            translate([wall,wall,base])
                cube( [w, d, h+1 ] );
            translate([47.5+wall,d+wall/2,25+base])
                cube( [60, 4, 5 ] );
            translate([16+wall,-1,22+base])
                cube( [20, 4, 4 ] );
            
            //switches
            translate([79+wall,-1,24+base])
                cube( [4.5, 2*wall, 2] );
            translate([95.5+wall,-1,24+base])
                cube( [4.5, 2*wall, 2] );
            translate([116+wall,-1,24+base])
                cube( [4.5, 2*wall, 2] );
            translate([135+wall,-1,24+base])
                cube( [16, 2*wall, 4] );
            
            // bottom
            translate([-1,10+wall,21+base])
                cube( [wall*2, 70, 5 ] );
            translate([-1,50+wall,12+base])
                cube( [wall*2, 18, 9 ] );
            translate([-1,68+wall,19+base])
                cube( [wall*2, 14, 8 ] );
        }
    }
