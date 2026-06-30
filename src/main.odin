package main

import rl "vendor:raylib" 
import "core:fmt"
//import "core:math/rand"
import geo "../geometry"

Vec2 :: [2]f32
realWorld_obj :: struct{
    position: Vec2,
    velocity: Vec2,
    acceleration:  Vec2,
    mass:     f32,
}

collision_count : int
main :: proc(){

    title : cstring = "Simulacrum Of your mum"
    fps : f32 = 60
    rl.SetTargetFPS(cast(i32)fps)
    rl.InitWindow(800, 600, title)
    player : realWorld_obj
    player.position = geo.cfc({200, 50})
    radius: f32 = 30

    // the projectile moves 10(?) in 1s
    for !rl.WindowShouldClose() {
        speed: f32 = 10 

        if rl.IsKeyDown(.DOWN){ radius-= speed }
        else if rl.IsKeyDown(.UP){ radius+= speed }
        else if rl.IsKeyPressed(.N){
            player.position.x = cast(f32)rl.GetScreenWidth()/2
            player.position.y = cast(f32)rl.GetScreenHeight()/2 
        }
        if rl.IsKeyDown(.D){ player.position.x += speed}
        if rl.IsKeyDown(.A){ player.position.x -= speed}
        if rl.IsKeyDown(.W){ player.position.y += speed}
        if rl.IsKeyDown(.S){ player.position.y -= speed}
        
        rl.BeginDrawing()
        rl.ClearBackground(rl.BLACK)


        // Time to draw all the frames: FPS * rl.GetFrameTime()
        circle1 := geo.cfc(-player.position)
        circle2 := geo.cfc(player.position)
        rl.DrawCircleV( circle1 , radius, {255, 0, 255, 255})
        rl.DrawCircleV( circle2, radius, {0, 255, 255, 255})
        rl.DrawText(fmt.ctprint("Position(cyan): ", player.position), rl.GetScreenWidth()/100,0, 24, rl.YELLOW )
        rl.DrawText(fmt.ctprint("Position(pink): ", -player.position) ,rl.GetScreenWidth() - 350 , 0 , 24, rl.YELLOW )
        rl.EndDrawing()

        if (rl.CheckCollisionCircles (circle1, radius, circle2, radius)){
            player.position = -player.position
            fmt.println("Collied bitch... {} ", collision_count)
            collision_count+= 1
        }
    }
}
