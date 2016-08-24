defmodule Rtex.Image.Ppm do
    def save(data, filename, width, height) do
        {:ok, file} = File.open filename, [:write]
        IO.binwrite file, "P3\n#{width} #{height}\n255\n"
        write_line(data, file)
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