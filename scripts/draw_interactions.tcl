## Functions to draw cylinders between pairs of atoms.

proc draw_interactions { mol pairs_file color radius} {
    ## Given a CSV of two columns with the PDB serial numbers for
    ## atoms, draw cylinders of the given parameters (color, radius)
    ## for them all.

    # read in contact pairs
    set file [open $pairs_file]

    # read in each line from the file
    while {[gets $file cline] >= 0} {
        # split on whitespace
        set inds [split $cline ","]
        # set variables from each row
        set ind1 [lindex $inds 0]
        set ind2 [lindex $inds 1]

        # make two selections for each atom
        set sel1 [atomselect $mol "serial $ind1"]
        set sel2 [atomselect $mol "serial $ind2"]
        # assign the coordinates to two variables
        lassign [$sel1 get {x y z}] start
        lassign [$sel2 get {x y z}] end

        # set the color for the graphics
        graphics $mol color $color
        # draw the cylinder
        graphics $mol cylinder $start $end radius $radius
    }
    close $file
}


proc draw_interaction { mol serial_a serial_b color radius} {

    # make two selections for each atom
    set sel1 [atomselect $mol "serial $serial_a"]
    set sel2 [atomselect $mol "serial $serial_b"]
    # assign the coordinates to two variables
    lassign [$sel1 get {x y z}] start
    lassign [$sel2 get {x y z}] end

    # set the color for the graphics
    graphics $mol color $color
    # draw the cylinder
    graphics $mol cylinder $start $end radius $radius
}


proc draw_interaction_lines { mol pairs_file color width} {

    # read in contact pairs
    set file [open $pairs_file]

    # read in each line from the file
    while {[gets $file cline] >= 0} {
        # split on whitespace
        set inds [split $cline ","]
        # set variables from each row
        set ind1 [lindex $inds 0]
        set ind2 [lindex $inds 1]

        # make two selections for each atom
        set sel1 [atomselect $mol "serial $ind1"]
        set sel2 [atomselect $mol "serial $ind2"]
        # assign the coordinates to two variables
        lassign [$sel1 get {x y z}] start
        lassign [$sel2 get {x y z}] end

        # set the color for the graphics
        graphics $mol color $color
        # draw the cylinder
        graphics $mol line $start $end width $width
    }
    close $file
}
