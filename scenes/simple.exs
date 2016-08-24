alias Rtex.Viewport, as: Viewport
alias Rtex.Renderer.SimpleRenderer, as: SimpleRenderer
alias Rtex.Scene, as: Scene

scene = %Scene{
#    camera: %PinholeCamera{
#        position: {-2, -2, -1},
#        look_at: {0, 0, -1}
#    },
#    lights: [
#        %AreaLight{
#            position {1000, 1000, 1000}
#        }
#    ],
#    models: [
#        %Sphere{
#            origin: {0, 0.5, 0},
#            radius: 0.5
#        },
#        %Sphere{
#            origin: {0, -100, 0},
#            radius: 100
#        }
#    ]
}

viewport = %Viewport{
    width: 400,
    height: 300
}

scene
    |> Rtex.Renderer.SimpleRenderer.render(viewport)
    |> Rtex.Image.Png.save("simple.png")
