class Queue
    def initialize(stored_queue)
        @stored_queue = []
    end

    def enqueue(el)
        @stored_queue << el
    end

    def dequeue
        @stored_queue.shift
    end

    def peek
        @stored_queue[0]
    end
end
