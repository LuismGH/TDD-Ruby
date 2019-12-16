module Alimento
  # Clase PlatoDieta, clase hija de Plato. Representa un plato como cualquier otro
  # pero incluye la cantidad de emisiones, de terreno y la huella nutricional del
  # plato.
  class PlatoDieta < Plato

    # Método para la creación de un objeto
  	def initialize(nombre, alimentos, cantidades)
  	  super(nombre, alimentos, cantidades)
  	end

    # Método de Instancia para hallar el valor total de las emisiones del plato
    def valor_emisiones
  	  emision = 0
  	  @alimentos.zip(@cantidades).each { |alimento, cantidad| emision += alimento.emision * cantidad }
  	  return emision.round(2)
  	end

    # Método de Instancia para hallar la cantidad total de terreno utilizado para la creación del plato
  	def valor_terreno
  	  terreno = 0
  	  @alimentos.zip(@cantidades).each { |alimento, cantidad| terreno += alimento.terreno * cantidad }
  	  return terreno.round(2)
  	end

    # Método to_s
  	def to_s
  	  return "#{valor_calorico}kcal"
  	end

    # Método de Instancia para hallar la huella nutricional de un plato
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