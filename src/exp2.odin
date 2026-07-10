package main

import rl "vendor:raylib" 
import "core:fmt"
import geo "../geometry"

Vec2 :: [2]f32
realWorld_obj :: struct{
    position: Vec2,
    velocity: Vec2,
    acceleration:  Vec2,
    mass:     f32,
    collidable: bool,
}

circle :: struct {
    pos: Vec2,
    radius: f32,
    color: rl.Color,
}

radius: f32 = 30
collision_count : int
main :: proc(){

    title : cstring = "Simulacrum Of your mum"
    fps : f32 = 120
    rl.SetTargetFPS(cast(i32)fps)
    rl.InitWindow(800, 600, title)
    player : realWorld_obj
    speed : f32 = 60
    player = {
        geo.cfc(
        {200, 50}),
        // 10 is the pixels i want to move in 1 frame
        {30 * 1/fps , 30 * 1/fps},
        {0, 0},
        10,
        true
    }

    // wall := rl.LoadTexture("../resources/walls.png")
    // the projectile moves 10(?) in 1s
    for !rl.WindowShouldClose() {
        current_radius := radius;

        if rl.IsKeyPressed(.N){
            player.position = {0, 0}
        }
        if rl.IsKeyDown(.W){ player.position.y += player.velocity.y}
        if rl.IsKeyDown(.A){ player.position.x -= player.velocity.x}
        if rl.IsKeyDown(.S){ player.position.y -= player.velocity.y}
        if rl.IsKeyDown(.D){ player.position.x += player.velocity.x}
        
        rl.BeginDrawing()
        rl.ClearBackground(rl.BLACK)

        if player.position.y + radius > cast(f32)rl.GetScreenHeight()/2{
            player.position.y = cast(f32)rl.GetScreenHeight()/2 - radius
        }
        if player.position.y - radius < -cast(f32)rl.GetScreenHeight()/2{
            player.position.y = -cast(f32)rl.GetScreenHeight()/2 + radius
        }
        if player.position.x + radius > cast(f32)rl.GetScreenWidth()/2{
            player.position.x = cast(f32)rl.GetScreenWidth()/2 - radius
        }
        if player.position.x - radius < -cast(f32)rl.GetScreenWidth()/2{
            player.position.x = -cast(f32)rl.GetScreenWidth()/2 + radius
        }

        circle1 : circle= {
            geo.cfc(player.position),
            radius,
            {0, 255, 255, 255},
        }
        rl.DrawCircleV(circle1.pos , circle1.radius, circle1.color)
        if rl.IsKeyPressed(.L){
            fmt.println(player.position)
        }
        rl.DrawText(fmt.ctprint("Position: ", player.position), rl.GetScreenWidth()/100,0, 24, rl.YELLOW )
        rl.EndDrawing()
    }
}
