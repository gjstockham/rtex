defmodule Rtex.Image.Ppm do
    def save(data, filename) do
        sorted = Enum.sort(data, fn({r1, c1, _}, {r2, c2, _}) -> 
            if r1 == r2 do
                c1 < c2
            else
                r1 > r2
            end    
        end)
        height = Enum.map(data, fn({r, c, _}) -> r end) |> Enum.max
        width = Enum.map(data, fn({r, c, _}) -> c end) |> Enum.max
        IO.inspect height
        IO.inspect width
        {:ok, file} = File.open filename, [:write]
        IO.binwrite file, "P3\n#{width+1} #{height+1}\n255\n"
        Enum.map(sorted, fn({r, c, colour}) -> colour end)
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