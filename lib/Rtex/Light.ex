defprotocol Rtex.Light do
    def get_direction(light, shade_rec)

    def light(light, shade_rec)
end