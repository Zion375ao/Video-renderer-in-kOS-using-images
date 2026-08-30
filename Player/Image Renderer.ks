set g to GUI(400).
set g:style:bg to "".

local Start to g:addbutton("Start?").
    set Start:style:width to 70.

g:show().
until Start:takepress {
    wait 0.
    clearscreen.
    print "Button has yet to be pressed".
}

print "Button has been pressed!".
print "Now playing animation".

Start:hide().
local test to g:addlabel().
    set test:style:height to 600.
    set test:style:width to 1000.
    set test:style:vstretch to TRUE.

    set test:style:normal:bg to "".


set file_path to "BAD_APPLE/0000".
animate(10,1,6572,0,450,10000,false).

function animation {
    parameter file_path, anim_frame.

    set test:style:normal:bg to file_path + anim_frame + ".jpg".
}

function animate {
    parameter offset, anim_start, anim_end, start, end, duration, continuous.

    local animationTime to 0.
    local Time_Duration to 0.019.
    local phase to 2.

    until animationTime = duration {
        clearscreen.

        if anim_start >= 10 and anim_start < 100 {
            set file_path to "BAD_APPLE/000".
        } else if anim_start >= 100 and anim_start < 1000 {
            set file_path to "BAD_APPLE/00".
        } else if anim_start >= 1000 {
                set file_path to "BAD_APPLE/0".
            }

        if phase = 1 {
            animation(file_path, anim_start).

            if anim_start = anim_end {
                set anim_start to 0.
            }

            if start = end {
                set phase to 2.
            }
            
            set animationTime to animationTime + 1.
            set anim_start to anim_start + 1.
            set start to start + offset.

            set test:style:overflow:top to -450 + start.
            set test:style:overflow:bottom to 450 - start.
            wait 0.01.
        } else if phase = 2 {
            animation(file_path, anim_start).
            set g:x to 0.
            set g:y to 0.

            if anim_start = anim_end and continuous = true {
                set anim_start to 0.
            } else if anim_start = anim_end and continuous = false {
                break.
            }

            set anim_start to anim_start + 1.
            wait Time_Duration.
        }
    }
    
    wait 1.
    set test:style:normal:bg to "".
}
