module Alimento
  # Clase Plato. Representa un plato de una dieta (un conjunto de alimentos con unas cantidades). 
  # A su vez, cuenta con sus % de proteínas, hidratos de carbono y lípidos.
  class Plato
    include Comparable

    # Nombre del Plato
  	attr_reader :nombre
    # Lista de Alimentos del Plato
    attr_reader :alimentos
    # Lista de Cantidades de cada alimento del Plato
    attr_reader :cantidades

    # Método para la creación de un objeto
  	def initialize(nombre, alimentos, cantidades)
  		@nombre, @alimentos, @cantidades = nombre, alimentos, cantidades
  	end

    # Método de Instancia para hallar el % de proteínas de un plato
  	def porcentaje_proteinas
  		proteinas = 0
  		@alimentos.zip(@cantidades).each { |alimento, cantidad| proteinas += alimento.p * cantidad }
  		return ((proteinas/total_plato)*100).round(2)
  	end

    # Método de Instancia para hallar el % de hidratos de carbono de un plato
    def porcentaje_hidratos
  		hidratos = 0
  		@alimentos.zip(@cantidades).each { |alimento, cantidad| hidratos += alimento.g * cantidad }
  		return ((hidratos/total_plato)*100).round(2)
  	end

    # Método de Instancia para hallar el % de lípidos de un plato
  	def porcentaje_lipidos
  		lipidos = 0
  		@alimentos.zip(@cantidades).each { |alimento, cantidad| lipidos += alimento.l * cantidad }
  		return ((lipidos/total_plato)*100).round(2)
  	end

    # Método de Instancia para hallar el total de gramos del plato
  	def total_plato
  		total = 0
  		@alimentos.zip(@cantidades).each { |alimento, cantidad| total += (alimento.p + alimento.g + alimento.l)* cantidad }
  		return total
  	end

    # Método de Instancia para hallar el valor calórico total del plato
  	def valor_calorico
  		kcal = 0
  		@alimentos.zip(@cantidades).each { |alimento, cantidad| kcal += alimento.get_valor_energetico.round(2) * cantidad }
  		return kcal
  	end

    # Método to_s
  	def to_s
  		return "#{self.class}: #{@nombre}, #{porcentaje_proteinas}% proteínas, #{porcentaje_hidratos}% hidratos, #{porcentaje_lipidos}% lípidos, #{valor_calorico}kcal"
  	end

    # Definición del Método del Mixin (Módulo Comparable)
    def <=>(other)
      return nil unless other.is_a? Plato
      valor_calorico <=> other.valor_calorico
    end
  end
end