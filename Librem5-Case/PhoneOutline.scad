//
// Copyright (C) 2020 Purism SPC
//
// SPDX-License-Identifier: GPL-3.0+
//

evergreen = 1;
pinch = 0.75;

// Phone Dimensions
pX = (evergreen == 1) ? 152 : 149;
pY = 75;
pZ = 15.5;

module phone() {
    $fn=60;
    r=8;

    r1 = r;
    r2 = r - pinch;
    
    hull() {
    //Main phone
    translate([r,r,4])
        cylinder(h=pZ-6, r1=r1, r2=r2);
    translate([r,pY-r,4])
        cylinder(h=pZ-6, r1=r1, r2=r2);
    translate([pX-r,pY-r,4])
        cylinder(h=pZ-6, r1=r1, r2=r2);
    translate([pX-r,r,4])
        cylinder(h=pZ-6, r1=r1, r2=r2);
    
    // back bezel
    // h = 4
    // d = 4
    offsetB = r+1;
    translate([offsetB,offsetB,0])
        cylinder(h=4, r=r-4);
    translate([offsetB, pY-offsetB,0])
        cylinder(h=4, r=r-4);
    translate([pX-offsetB,pY-offsetB,0])
        cylinder(h=4, r=r-4);
    translate([pX-offsetB,offsetB,0])
        cylinder(h=4, r=r-4);
        
    // top bezel
    // h = 2 
    // d = 1
    offsetT = r+1+pinch;
    translate([offsetT,offsetT,pZ-2])
        cylinder(h=2, r=r-1);
    translate([offsetT, pY-offsetT,pZ-2])
        cylinder(h=2, r=r-1);
    translate([pX-offsetT,pY-offsetT,pZ-2])
        cylinder(h=2, r=r-1);
    translate([pX-offsetT,offsetT,pZ-2])
        cylinder(h=2, r=r-1);
    }
}

//phone();
