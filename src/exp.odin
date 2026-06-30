package new

import "core:fmt"
import "core:math/rand"


add :: proc(x, y: i32) -> i32{
    fmt.println("Hello form add")
    return x+y
}
ne :: proc(x: i32, y: i32, function: proc(a, b: i32) -> i32) -> i32{
    return function(x, y)
}
main :: proc(){
    x: i32 = 100
    y: i32 = 200
    random_x := cast(f32)rand.int_max(cast(int)x)
    random_y := cast(f32)rand.int_max(cast(int)y)
    fmt.println(ne(x, y, add))
}
