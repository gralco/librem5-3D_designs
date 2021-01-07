//
// Copyright (C) 2020 Purism SPC
//
// SPDX-License-Identifier: GPL-3.0+
//

// slim needs to be defined before including this file
//slim = (slim > 0) ? slim : 0;

// Phone Dimensions
pX = (evergreen == 1) ? 152 : 149;
pY = 75;
pZ = 15;

module phone() {
    $fn=60;
    r=8;

    hull() {
    //Main phone
    translate([r,r,4])
        cylinder(h=pZ-6, r=r);
    translate([r,pY-r,4])
        cylinder(h=pZ-6, r=r);
    translate([pX-r,pY-r,4])
        cylinder(h=pZ-6, r=r);
    translate([pX-r,r,4])
        cylinder(h=pZ-6, r=r);
    
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
    offsetT = r+1;
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

// phone();
