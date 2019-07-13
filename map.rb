class Map
    #ie. my_map = [[k1, v1], [k2, v2], [k3, v2], ...]
    #a map stores information in key-value pairs, 
    #where the keys are always unique

    def initialize(stored_map)
        @stored_map = []
    end

    def set(key, value)
        @stored_map << [key, value] if @stored_map.length == 0
        (0...@stored_map.length).each do |i|
            pair = @stored_map[i]
            (0...pair.length).each do |j|
                curr_key = pair[j]
                if curr_key == key
                    pair[i] = key 
                    pair[i + 1] = value
                else
                    @stored_map << [key, value]
                end
            end
        end
        @stored_map
    end

    def get(key)
        @stored_map.each { |pair| return pair[1] if pair[0] == key }
    end

    def delete(key)
        @stored_map.reject! { |pair| pair[0] == key }
    end

    def show
        deleted_arr = delete(key)

        @stored_map.each do |pair|
            return pair if !deleted_arr.include?(pair)
        end
    end
end