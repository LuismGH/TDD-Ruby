module Alimento
  # Clase Alimento. Representa un alimento con sus respectivas proteínas,
  # glúcidos y lípidos.
  class Alimento
    include Comparable
    # Array con todos las instancias de la Clase
    @@alimentos = Array.new
    # Nombre del Alimento 
    attr_reader :name
    # Proteínas del Alimento
    attr_reader :p
    # Glúcidos del Alimento
    attr_reader :g
    # Lípidos del Alimento
    attr_reader :l
    # Cantidad de emisiones de gases de efecto invernadero
    attr_reader :emision
    # Terreno utilizado para la producción del alimento
    attr_reader :terreno

    # Método para la creación de un objeto
    def initialize(name,p,g,l,emision,terreno)
      @name, @p, @g, @l, @emision, @terreno = name, p, g, l, emision, terreno
      @@alimentos << self
    end

	  # Método de Instancia para hallar el Valor Energético de un alimento
    def get_valor_energetico
      return (@p*4)+(@g*4)+(@l*9)
    end

	  # Método to_s
    def to_s
      return "#{self.class}: #{@name},#{@p},#{@g},#{@l},#{@emision},#{@terreno}"
    end

    # Definición del Método del Mixin (Módulo Comparable)
	  def <=>(other)
	    return nil unless other.instance_of? Alimento 
      get_valor_energetico <=> other.get_valor_energetico
    end
	
    # Método de clase para calcular el impacto en los hombres de todas las instacias de alimentos
    def self.impacto_hombre
      kcal, proteinas = 0, 0
      @@alimentos.each { |x| kcal += x.get_valor_energetico; proteinas += x.p}
      if kcal > 3000 || proteinas > 54
        return true
      else
        return false
      end
    end

    # Método de clase para calcular el impacto en las mujeres de todas las instacias de alimentos
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
