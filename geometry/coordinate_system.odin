package geometry

import rl "vendor:raylib"
import "core:fmt"

Vec2 :: [2]f32

center_screen :: proc() -> Vec2{

    return {
        cast(f32)rl.GetScreenWidth(),
        cast(f32)rl.GetScreenHeight()
    }
}
// convert_from_cartesian
cfc :: proc(rl_pos: Vec2) -> Vec2{
    Center := center_screen()
    return { Center.x/2 + rl_pos.x , Center.y/2 - rl_pos.y }

}

// convert_from_cartesian_point
cfcp :: proc(point: f32, axis: int = 0) -> (result: f32){
    Center := center_screen()
    if axis == 0{ return Center.x/2 + point}
    else if axis == 1{ return Center.y/2 - point}
    else { fmt.println("0|1 => x|y") }
    return 0
}

