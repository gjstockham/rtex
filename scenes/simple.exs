

camera = Rtex.Camera.create({0, 1, 1}, {0, 0, -1}, {0, 1, 0}, 20)


scene = %Rtex.Scene{
    viewplane: %Rtex.ViewPlane{rows: 200, columns: 100 },
    camera: camera,
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
