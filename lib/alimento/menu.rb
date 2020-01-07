module Alimento
  # Clase Menu. Creado para hacer el DSL de un menú dietético
  class Menu
  	# Nombre del Menú
  	attr_reader :nombre
  	# Descricpción del Menú
  	attr_reader :descripcion
  	# Lista de Platos del Menú
  	attr_reader :platos
  	# Lista de Precios de los platos del Menú
  	attr_reader :precios
  	# Precio Total del Menú
  	attr_reader :precio
  	# Método para la creación de un objeto
  	def initialize(nombre, &block)
      @nombre = nombre
      @platos, @precios = List.new, List.new
  	  if block_given?
  		if block.arity == 1
  		  yield self
  		else
  	  	  instance_eval(&block)
  	    end
  	  end
  	end
  	# Método para el DSL
  	def Descripcion(descripcion)
  		@descripcion = descripcion
  	end
    # Método para el DSL
    def Componente(hash)
    	if hash.has_key?(:plato)
  	    @platos.insert(hash[:plato])
  	  else
  	    @platos.insert(PlatoDieta.new(hash[:descripcion], hash[:alimentos], hash[:cantidades]))
  	   end
  	  @precios.insert(hash[:precio])
  	end
  	# Método para el DSL
  	def Precio(precio)
  		@precio = precio
  	end
  end
end