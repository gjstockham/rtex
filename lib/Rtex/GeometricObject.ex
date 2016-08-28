defprotocol Rtex.GeometricObject do
  def hit(model, ray, t_min) 
  def normal(model, ray)
end