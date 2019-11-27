module Alimento
  class PlatoDieta < Plato
  	def initializa(nombre, alimentos, cantidades)
  	  super(nombre, alimentos, cantidades)
  	end

    def valor_emisiones
  	  emision = 0
  	  @alimentos.zip(@cantidades).each { |alimento, cantidad| emision += alimento.emision * cantidad }
  	  return emision.round(2)
  	end
  	def valor_terreno
  	  terreno = 0
  	  @alimentos.zip(@cantidades).each { |alimento, cantidad| terreno += alimento.terreno * cantidad }
  	  return terreno.round(2)
  	end
  	def to_s
  	  return "#{valor_calorico}kcal"
  	end
  end
end