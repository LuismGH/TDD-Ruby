module Alimento
  class List
    include Enumerable
    # Estructura de los Nodos
    Node = Struct.new(:value, :next, :prev)

    attr_reader :head, :tail, :size
    def initialize
      @head, @tail = nil
      @size = 0
    end

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

    def each(&block)
      nodo = @head
      while (nodo != nil) do
        yield nodo.value
        nodo = nodo.next
      end
    end
  end
end
