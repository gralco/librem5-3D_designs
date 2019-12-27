$fn=30;

center_hole=1;

module cutouts() {
    /* center hole */
    translate([1,3.5,1]) 
        cube([55,46,11], false);
    translate([1,2.5,2]) 
        cube([55,46,11], false);

    if ( center_hole )
        translate([3.5,5.5,-1]) 
            cube([50,40,11], false);
    
    /* hold downs */
    cube([5,2.5,1.6], false);  
    translate([52,0,0])
       cube([5,2.5,1.6], false);
    
    /* electrical connections */
    translate([34,-0.5,1.5]) 
        cube([2.5,1,6.5], false);
    translate([37,-0.5,1.5]) 
        cube([2.5,1,6.5], false);
    translate([40,-0.5,1.5]) 
        cube([2.5,1,6.5], false);

    /* wire guides */
    translate([35.25,0.5,1.5]) 
        cylinder(6.5, d=1, true);
    translate([38.25,0.5,1.5]) 
        cylinder(6.5, d=1, true);
    translate([41.25,0.5,1.5]) 
        cylinder(6.5, d=1, true);
    translate([35.25,0.5,2])
        rotate([-90,0,0])
            cylinder(6.5, d=1, true);
    translate([38.25,0.5,2])
        rotate([-90,0,0])
            cylinder(6.5, d=1, true);
    translate([41.25,0.5,2])
        rotate([-90,0,0])
            cylinder(6.5, d=1, true);
    translate([35.25,0.5,7.5])
        rotate([-90,0,0])
            cylinder(6.5, d=1, true);
    translate([38.25,0.5,7.5])
        rotate([-90,0,0])
            cylinder(6.5, d=1, true);
    translate([41.25,0.5,7.5])
        rotate([-90,0,0])
            cylinder(6.5, d=1, true);
};

difference() {
    cube([57,51,10], false);
    cutouts();
};
