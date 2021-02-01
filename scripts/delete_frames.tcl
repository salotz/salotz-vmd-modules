proc delete_frame { mol frame_idx } {
    animate delete beg $frame_idx end $frame_idx skip 0 $mol
}

