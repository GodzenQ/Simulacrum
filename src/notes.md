## Random Position Generation
random_x := cast(f32)rand.int32_range(0, rl.GetScreenWidth())
random_y := cast(f32)rand.int32_range(0, rl.GetScreenHeight())



## Rectangle moving relative to circle
text_box := rl.Rectangle({cfcp(100, 0), cfcp(20, 1), 100, 20})
rl.DrawRectangleRec(text_box, rl.LIGHTGRAY)


###  We are adding/subtracting, hence the (-)on pl.position directly 
### And on the output Vec2 of geo.cfc() is diff.

``` rl.DrawCircleV( geo.cfc(-player.position) , radius, {255, 0, 255, 255})```

