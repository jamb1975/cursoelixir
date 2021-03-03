defprotocol DbHandler do
  def create_tercero(handler, tercero)
  def find_tercero(handler, id)
end    