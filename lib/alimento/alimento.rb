module Alimento
  class Alimento
    # Array con todos los objetos de la Clase
    @@alimentos = Array.new
    # Atributos
    attr_reader :name, :p, :g, :l, :emision, :terreno

    def initialize(name,p,g,l,emision,terreno)
      @name, @p, @g, @l, @emision, @terreno = name, p, g, l, emision, terreno
      @@alimentos << self
    end

    # Getters
    def get_name
      return @name
    end

    def get_proteinas
      return @p
    end

    def get_glucidos
      return @g
    end

    def get_lipidos
      return @l
    end

    def get_emisiones
      return @emision
    end

    def get_terreno
      return @terreno
    end

    def get_valor_energetico
      return (@p*4)+(@g*4)+(@l*9)
    end

    # Método de instancia para mejorar la información que se presenta de una clase
    def to_s
      return "#{self.class}: #{@name},#{@p},#{@g},#{@l},#{@emision},#{@terreno}"
    end

    # Métodos de clase
    def self.impacto_hombre
      kcal, proteinas = 0, 0
      @@alimentos.each { |x| kcal += x.get_valor_energetico; proteinas += x.get_proteinas}
      if kcal > 3000 || proteinas > 54
        return true
      else
        return false
      end
    end

    def self.impacto_mujer
      kcal, proteinas = 0, 0
      @@alimentos.each { |x| kcal += x.get_valor_energetico; proteinas += x.get_proteinas}
      if kcal > 2300 || proteinas > 41
        return true
      else
        return false
      end
    end
  end
end
