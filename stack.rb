 class Stack
    def initialize(stored_stack)
      # create ivar to store stack here!
      @stored_stack = []
    end

    def push(el)
      # adds an element to the stack
      @stored_stack << el
    end

    def pop
      # removes one element from the stack
      @stored_stack.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @stored_stack[-1]
    end
  end