module Alimento
  class List
    # Estructura de los Nodos
    Node = Struct.new(:value, :next, :prev)

    attr_reader :head, :tail
    def initialize(value)
      @head = Node.new(value, nil, nil)
      @tail = @head
    end

    def insert(value)
      current_node = @head
      while current_node.next != nil
        current_node = current_node.next
      end
      current_node.next = Node.new(value, nil, current_node)
    end

    def remove(value)
      current_node = @head
      if current_node.value == value
        @head = current_node.next
      else
        while (current_node.next != nil) && (current_node.next.value != value)
          current_node = current_node.next
        end
        if current_node.next != nil
          current_node.next = current_node.next.next
        end
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
  end
end
