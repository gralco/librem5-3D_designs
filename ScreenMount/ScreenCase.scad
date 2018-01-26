//
// Copyright (C) 2018 Purism SPC
//
// SPDX-License-Identifier: GPL-3.0+
//

thickness=1;
bezel=2;
disp_h=129;
disp_w=72;
$fn=60;

difference() {
    minkowski() {
        cube([2*bezel+disp_w, 2*bezel+disp_h, thickness] );
        cylinder(r=bezel, h=thickness);
    }
    union() {
    translate([bezel, bezel, thickness])
        cube([disp_w, disp_h, thickness*2] );
    translate([disp_w+bezel-57, -(bezel*2), thickness])
        cube([57, disp_h, thickness*2] );
    }
}
