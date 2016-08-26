defprotocol Rtex.Material do
    def shade(material, shade_rec, ambient, lights) 
end