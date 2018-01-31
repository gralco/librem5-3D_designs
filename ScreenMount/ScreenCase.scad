//
// Copyright (C) 2018 Purism SPC
//
// SPDX-License-Identifier: GPL-3.0+
//

thickness=1.5;
base_thickness=2;
bezel=2;
disp_h=130;
disp_w=72;
$fn=60;

difference() {
    minkowski() {
        cube([2*bezel+disp_w, 2*bezel+disp_h, base_thickness ]);
        cylinder(r=bezel, h=thickness);
    }
    union() {
    translate([bezel, bezel, base_thickness])
        cube([disp_w, disp_h, thickness+1] );
    translate([disp_w+bezel-57, -(bezel*2), -1])
        cube([54, bezel*3, thickness+base_thickness+2] );
    }
}
