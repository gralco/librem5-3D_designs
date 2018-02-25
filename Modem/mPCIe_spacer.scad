r=1.5;
// low profile
h=1.55;
// high profile
// h=4.15;

$fn=60;

difference() {
    cylinder( r=r+1, h=h );
    translate([0,0, -1])
    cylinder( r=r, h=h*2 );
};