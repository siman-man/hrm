class String
  def zero?
    false
  end

  def negative?
    false
  end
end

module HRM
  module Instruction
    def inbox
      unless @value = STDIN.gets&.chomp
        exit(0)
      end

      if @value =~ /^[-+]?[0-9]+$/
        @value = @value.to_i
      end
    end

    def outbox
      puts @value
      @value = nil
    end

    def copyfrom(address)
      @value = @memory[address]
    end

    def copyto(address)
      @memory[address] = @value
    end

    def add(address)
      @value += @memory[address]
    end

    def sub(address)
      @value -= @memory[address]
    end

    def bumpup(address)
      @value = @memory[address] += 1
    end

    def bumpdown(address)
      @value = @memory[address] -= 1
    end

    def jump(address)
      @pc = address
    end

    def jump_if_zero(address)
      if @value.zero?
        @pc = address
      end
    end

    def jump_if_neg(address)
      if @value.negative?
        @pc = address
      end
    end
  end
end