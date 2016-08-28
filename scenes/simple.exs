
scene = %Rtex.Scene{
    viewplane: %Rtex.ViewPlane{rows: 100, columns: 200 },
    camera: %Rtex.Camera{},
    models: [
        %Rtex.GeometricObject.Sphere{
            centre: {0, 0, -1},
            radius: 0.5
        },
        %Rtex.GeometricObject.Sphere{
            centre: {0, -100.5, -1},
            radius: 100
        }
    ]
}

scene
    |> Rtex.Renderer.render(100)
    |> Rtex.Image.save("_output/simple.ppm", format: Rtex.Image.Ppm)
