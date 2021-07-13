require_relative "room"

class Hotel

    def initialize(name,room_capacities)
        @name= name
        @rooms= {}
        room_capacities.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    def name
        words=@name.split(" ")
        words.map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        if @rooms[room_name]
            return true
        else
            return false
        end
    end

    def check_in(person, room)
        if self.room_exists?(room)
            if @rooms[room].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        if @rooms.any?{|room_name, room| room.full? ==false}
            return true
        else
            return false
        end
    end

    def list_rooms
        @rooms.each do |room_name, room|
            puts "#{room_name} : #{room.available_space}"
        end
    end



end
