
scene = %Rtex.Scene{
    viewplane: %Rtex.ViewPlane{rows: 100, columns: 200 },
    camera: %Rtex.Camera{},
    models: [
        %Rtex.GeometricObject.Sphere{
            centre: {0, 0, -1},
            radius: 0.5
        }
    ]
}

scene
    |> Rtex.Renderer.render
    |> Rtex.Image.save("_output/simple.ppm", format: Rtex.Image.Ppm)
