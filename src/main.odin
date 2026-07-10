package main

import "core:sys/windows"
import rl "vendor:raylib"
import geo "../geometry"
import "core:fmt"

title : cstring = "Zaarr"
screen_width :i32= 800
screen_height :i32= 600
icon := rl.LoadImage("../assets/shark.png")

body :: struct {
    position     :     rl.Vector2,
    velocity     :     rl.Vector2,
    acceleration :     rl.Vector2
}

main :: proc(){

    // rl.SetWindowIcon(icon)
    rl.SetWindowIcon(icon)
    rl.InitWindow(screen_width, screen_height, title)
    for !rl.WindowShouldClose() {
        update()
        rl.BeginDrawing()
        rl.ClearBackground(rl.BLACK)
        draw()
        rl.EndDrawing()
    }
}
update :: proc(){
}
