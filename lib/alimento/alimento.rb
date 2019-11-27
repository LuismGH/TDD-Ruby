module Alimento
  class Alimento
    include Comparable
    # Array con todos los objetos de la Clase
    @@alimentos = Array.new
    # Atributos
    attr_reader :name, :p, :g, :l, :emision, :terreno

    def initialize(name,p,g,l,emision,terreno)
      @name, @p, @g, @l, @emision, @terreno = name, p, g, l, emision, terreno
      @@alimentos << self
    end

	# Valor Energético
    def get_valor_energetico
      return (@p*4)+(@g*4)+(@l*9)
    end

	# Invalidando...
    def to_s
      return "#{self.class}: #{@name},#{@p},#{@g},#{@l},#{@emision},#{@terreno}"
    end

    # Definición del Método del Mixin
	  def <=>(other)
	    return nil unless other.instance_of? Alimento 
      get_valor_energetico <=> other.get_valor_energetico
    end
	
    # Métodos de clase
    def self.impacto_hombre
      kcal, proteinas = 0, 0
      @@alimentos.each { |x| kcal += x.get_valor_energetico; proteinas += x.p}
      if kcal > 3000 || proteinas > 54
        return true
      else
        return false
      end
    end
    def self.impacto_mujer
      kcal, proteinas = 0, 0
      @@alimentos.each { |x| kcal += x.get_valor_energetico; proteinas += x.p}
      if kcal > 2300 || proteinas > 41
        return true
      else
        return false
      end
    end
  end
end
