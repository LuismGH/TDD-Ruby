module Alimento
  # Clase List. Representa una lista doblemente enlazada, con su
  # respectiva cabeza y cola.
  class List
    include Enumerable
    # Estructura de los Nodos de la Lista
    Node = Struct.new(:value, :next, :prev)
    # Cabeza de la Lista
    attr_reader :head
    # Cola de la Lista
    attr_reader :tail
    # Tamaño de la Lista
    attr_reader :size

    # Método para la creación de un objeto
    def initialize
      @head, @tail = nil
      @size = 0
    end

    # Método de Instancia para insertar un nodo en la lista
    def insert(value)
      if @size == 0
        @head = Node.new(value, nil, nil)
        @tail = @head
      else
        current_node = @head
        while current_node.next != nil
          current_node = current_node.next
        end
        current_node.next = Node.new(value, nil, current_node)
        @tail = current_node.next
      end
      @size = @size + 1
    end

    # Métodod de Instancia para eliminar la cabeza de la lista
    def remove_head
      if @size != 0
        nodo = @head
        if @size > 1
          @head.next.prev = nil
        end
        @head = @head.next
        @size = @size - 1
        return nodo.value
      end
    end

    # Métodod de Instancia para eliminar la cola de la lista
    def remove_tail
      if @size != 0
        nodo = @tail
        if @size > 1
          @tail.prev.next = nil
        end
        @tail = @tail.prev
        @size = @size - 1
        return nodo.value
      end
    end

    # Métodod de Instancia para buscar un elemento en la lista
    def search(value)
      current_node = @head
      while (current_node.next != nil) && (current_node.value != value)
        current_node = current_node.next
      end
      if current_node.value == value
        return true
      else
        return false
      end
    end

    # Definición del Método each (Módulo Enumerable)
    def each(&block)
      nodo = @head
      while (nodo != nil) do
        yield nodo.value
        nodo = nodo.next
      end
    end
  end
end
