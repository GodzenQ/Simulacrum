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
    collidable: bool,
}

collision_count : int
main :: proc(){

    title : cstring = "Simulacrum Of your mum"
    fps : f32 = 120
    rl.SetTargetFPS(cast(i32)fps)
    rl.InitWindow(800, 600, title)
    player : realWorld_obj
    player = {
        geo.cfc(
        {200, 50}),
        // 10 is the unit i want to move in 1 frame
        {10 * 1/fps * 60, 10 * 1/fps * 60},
        {0, 0},
        10,
        true
    }
    radius: f32 = 30

    // Boundary
    // wall := rl.LoadTexture("../resources/walls.png")
    // the projectile moves 10(?) in 1s
    for !rl.WindowShouldClose() {
        current_radius := radius;

        // if rl.IsKeyDown(.DOWN){ player.velocity= {10, 10} }
        // else if rl.IsKeyDown(.UP){ player.velocity= {1,1} }
        if rl.IsKeyPressed(.N){
            player.position = {0, 0}
        }
        if rl.IsKeyDown(.W){ player.position.y += player.velocity.y}
        if rl.IsKeyDown(.A){ player.position.x -= player.velocity.x}
        if rl.IsKeyDown(.S){ player.position.y -= player.velocity.y}
        if rl.IsKeyDown(.D){ player.position.x += player.velocity.x}
        
        rl.BeginDrawing()
        rl.ClearBackground(rl.BLACK)
        if player.position.y > cast(f32)rl.GetScreenHeight()/2 || player.position.y < -cast(f32)rl.GetScreenHeight()/2{
            player.position.y = -player.position.y
        }
        if player.position.x > cast(f32)rl.GetScreenWidth()/2 || player.position.x < -cast(f32)rl.GetScreenWidth()/2{
            player.position.x = -player.position.x
        }
        circle1 := geo.cfc(player.position)
        circle2 := geo.cfc(-player.position)
        rl.DrawCircleV( circle1 , radius, {0, 255, 255, 255})
        // rl.DrawCircleV( circle2 , radius, {255, 0, 255, 255})
        // rl.DrawLine(rl.GetScreenWidth()/2, 0, rl.GetScreenWidth()/2, rl.GetScreenHeight(), rl.GREEN)
        if rl.IsKeyPressed(.L){
            fmt.println(player.position)
        }
        rl.DrawText(fmt.ctprint("Position: ", player.position), rl.GetScreenWidth()/100,0, 24, rl.YELLOW )
        rl.EndDrawing()
    }
}
