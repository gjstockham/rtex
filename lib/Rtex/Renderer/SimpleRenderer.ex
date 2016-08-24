defmodule Rtex.Renderer.SimpleRenderer do
    @behaviour Rtex.Renderer
            
    def render(scene, viewport) do
        IO.puts "Rendering scene"
        "Test complete"
    end

end