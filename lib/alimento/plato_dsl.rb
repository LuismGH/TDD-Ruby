module Alimento
  # Clase PlatoDSL. Creada para hacer el DSL de un plato de una dieta
  class PlatoDSL < PlatoDieta
  	# Método para la creación de un objeto
  	def initialize(nombre, &block)
      super(nombre)
  	  if block_given?
  		if block.arity == 1
  		  yield self
  		else
  	  	  instance_eval(&block)
  	    end
  	  end
  	end
  	# Método para el DSL
  	def Nombre(nombre)
      @nombre = nombre
    end
    # Método para el DSL
  	def Alimento(hash)
  	  if hash.has_key?(:alimento)
  	    @alimentos.insert(hash[:alimento])
  	  else
  	    @alimentos.insert(Alimento.new(hash[:descripcion], hash[:proteinas], hash[:glucidos],
  	  	                               hash[:lipidos], hash[:emisiones], hash[:terreno]))
  	   end
  	  @cantidades.insert(hash[:gramos])
    end
  end
end