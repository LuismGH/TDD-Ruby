module Alimento
  class Plato
    include Comparable
  	attr_reader :nombre, :alimentos, :cantidades
  	def initialize(nombre, alimentos, cantidades)
  		@nombre, @alimentos, @cantidades = nombre, alimentos, cantidades
  	end

  	def porcentaje_proteinas
  		proteinas = 0
  		@alimentos.zip(@cantidades).each { |alimento, cantidad| proteinas += alimento.p * cantidad }
  		return ((proteinas/total_plato)*100).round(2)
  	end
    def porcentaje_hidratos
  		hidratos = 0
  		@alimentos.zip(@cantidades).each { |alimento, cantidad| hidratos += alimento.g * cantidad }
  		return ((hidratos/total_plato)*100).round(2)
  	end
  	def porcentaje_lipidos
  		lipidos = 0
  		@alimentos.zip(@cantidades).each { |alimento, cantidad| lipidos += alimento.l * cantidad }
  		return ((lipidos/total_plato)*100).round(2)
  	end

  	def total_plato
  		total = 0
  		@alimentos.zip(@cantidades).each { |alimento, cantidad| total += (alimento.p + alimento.g + alimento.l)* cantidad }
  		return total
  	end
  	def valor_calorico
  		kcal = 0
  		@alimentos.zip(@cantidades).each { |alimento, cantidad| kcal += alimento.get_valor_energetico.round(2) * cantidad }
  		return kcal
  	end

  	def to_s
  		return "#{self.class}: #{@nombre}, #{porcentaje_proteinas}% proteínas, #{porcentaje_hidratos}% hidratos, #{porcentaje_lipidos}% lípidos, #{valor_calorico}kcal"
  	end

    def <=>(other)
      return nil unless other.is_a? Plato
      valor_calorico <=> other.valor_calorico
    end
  end
end