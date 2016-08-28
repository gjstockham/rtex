defmodule Rtex.Image.Ppm do
    @moduledoc """
    Save images as PPM format
    """

    def save(data, filename) do
        sorted = Enum.sort(data, fn({x1, y1, _}, {x2, y2, _}) -> 
            if y1 == y2 do
                x1 < x2
            else
                y1 > y2
            end    
        end)
        height = data |> Enum.map(fn({x, y, _}) -> y end) |> Enum.max
        width = data |> Enum.map(fn({x, y, _}) -> x end) |> Enum.max
        {:ok, file} = File.open filename, [:write]
        IO.binwrite file, "P3\n#{width+1} #{height+1}\n255\n"
        sorted 
            |> Enum.map(fn({x, y, colour}) -> colour end)
            |> write_line(file)
        File.close file
    end

    defp write_line([head|tail], file) do
        {r, g, b} = head
        IO.binwrite file, "#{round(255*r)} #{round(255*g)} #{round(255*b)}\n" 
        write_line(tail, file)
    end

    defp write_line([], file) do
        IO.puts "Finished file write"
    end
end