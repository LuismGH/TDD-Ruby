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

    def huella_nutricional
      indice_energia, indice_emisiones = 0.0

      # Índice de la energía del plato
      if valor_calorico < 670
        indice_energia = 1.0
      elsif valor_calorico > 830
        indice_energia = 3.0
      else
        indice_energia = 2.0
      end
      
      # Índice de las emisiones del plato
      if valor_emisiones < 800
        indice_emisiones = 1.0
      elsif valor_emisiones > 1200
        indice_emisiones = 3.0
      else
        indice_emisiones = 2.0
      end

      # Devolvemos la media
      return ((indice_energia + indice_emisiones) / 2)
    end
  end
end