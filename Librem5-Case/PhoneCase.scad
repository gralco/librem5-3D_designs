//
// Copyright (C) 2020-2021 Purism SPC
//
// SPDX-License-Identifier: GPL-3.0+
//

// Configuration options
evergreen = 1; // 0 for dogwood case
slim = 0; // default to bumper case
raingear = 0; // 1 don't add any cutouts
pinch = 0;

include <PhoneOutline.scad>;

// Case thickness
cX = (slim == 0) ? 3.5 : 1.6;
cY = (slim == 0) ? 2.5 : 1.6;
cZ = (slim == 0) ? 2 : 1;

// Case outside Dimesions
oY = pY+2*cY;
oX = pX+2*cX;
oZ = pZ+2*cZ;

$fn=60;
r=8;
 
module case_base() {
    r1 = r;
    r2 = r - pinch;
    
    hull() {
    //Main Case
    translate([r,r,4])
        cylinder(h=oZ-6, r1=r1, r2=r2);
    translate([r,oY-r,4])
        cylinder(h=oZ-6, r1=r1, r2=r2);
    translate([oX-r,oY-r,4])
        cylinder(h=oZ-6, r1=r1, r2=r2);
    translate([oX-r,r,4])
        cylinder(h=oZ-6, r1=r1, r2=r2);
    
    // back bezel
    // h = 4
    // d = 4
    bO = r+2;
    translate([bO,bO,0])
        cylinder(h=4, r=r-2);
    translate([bO, oY-bO,0])
        cylinder(h=4, r=r-2);
    translate([oX-bO,oY-bO,0])
        cylinder(h=4, r=r-2);
    translate([oX-bO,bO,0])
        cylinder(h=4, r=r-2);
        
    // top bezel
    // h = 2 
    // d = 1
    tO = r+1+pinch;
    translate([tO,tO,oZ-2])
        cylinder(h=2, r=r-1);
    translate([tO, oY-tO,oZ-2])
        cylinder(h=2, r=r-1);
    translate([oX-tO,oY-tO,oZ-2])
        cylinder(h=2, r=r-1);
    translate([oX-tO,tO,oZ-2])
        cylinder(h=2, r=r-1);
    }
}

module display_cut() {
    hull() {
    offset = r+4+pinch;
    translate([offset,offset,oZ-3])
        cylinder(h=4, r=r-1);
    translate([offset, oY-offset,oZ-3])
        cylinder(h=4, r=r-1);
    translate([oX-offset,oY-offset,oZ-3])
        cylinder(h=4, r=r-1);
    translate([oX-offset,offset,oZ-3])
        cylinder(h=4, r=r-1);
    }
}

module camera_cuts() {
    // Camera
    translate([13.5+cX,49.5+cY,-cZ/2])
        cylinder(h=2*cZ, r1=6, r2=4);
    // Flash
    translate([13.5+cX,37.5+cY,-cZ/2])
        scale([2.5,1,1])
        cylinder(h=2*cZ, r1=4, r2=1.5);
}

module hks_cut() {
    hull() {
    translate([cX+24, -cY/2, cZ+7.25])
        cube([34, cY*2, 5]);
    // bezel edge
    translate([cX+22, -cY, cZ+6.25])
        cube([38, cY, 7]);
    }
}

module vol_cut() {
    d = (raingear == 0) ? cY*2 : cY*3/4;
    hull() {
    translate([cX+21, pY+cY-cY/2, cZ+8.25])
        cube([36, d, 4]);
    // bezel edge
    if (raingear == 0)
        translate([cX+18, pY+2*cY, cZ+7.25])
            cube([42, cY, 6]);
    }
}

module top_cuts() {
    // Headphone plug
    translate([-cX, cY+19, cZ+10])
        rotate([0, 90, 0])
            cylinder(h=cX*4, r1=5, r2=4);
}

module bottom_cuts() {
    // Mic
    translate([pX+cX/2, pY/2-20+cY, cZ+8.5])
        cube([cX*2, 10, 3]);
    // Speaker
    translate([pX+cX/2, pY/2+10+cY, cZ+8.5])
        cube([cX*2, 10, 3]);
    // USB C
    cutY1=14;
    translate([pX-cX, pY/2-cutY1/2+cY, cZ+6.5])
        cube([cX*4, cutY1, 7]);
}

module case() {
    difference() {
        case_base();
        union() {
            display_cut();
            translate([cX, cY, cZ]) phone();
            vol_cut();
            if (raingear == 0 ) {
                camera_cuts();
                hks_cut();
                top_cuts();
                bottom_cuts();
            }
        }
    }
}


case();

//translate([cX, cY, cZ]) color("red") phone();
