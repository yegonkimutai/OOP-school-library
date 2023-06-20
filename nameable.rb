class Nameable
    def correct_name
        raise NotImplementedError
    end
end

class Decorator < Nameable
    attr_accessor :nameable

    def initialize(nameable)
        @nameable = nameable
    end

    def correct_name
        @nameable.correct_name
    end
end

class CapitalizeDecorator < Decorator
    def correct_name
        @nameable.correct_name.upcase
    end
end

class TrimmerDecorator < Decorator 
    def correct_name
        words = @nameable.correct_name.split('')
        trimmed = words.length > 10 ? words[0..9] : words
        trimmed
    end
end
