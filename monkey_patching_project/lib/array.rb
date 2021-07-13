# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span
        return nil if self.empty?
        return self.max - self.min
    end

    def average
        return nil if self.empty?
        return self.inject {|sum, el| sum+el }/(self.length*1.0)
    end

    def median
       return nil if self.empty?
       return self.sort[(self.length-1)/2]   if self.length.odd?
       return ( (self.sort[(self.length/2)-1] + self.sort[(self.length/2)] )/2.0) if self.length.even?
    end

    def counts
        new_Hash=Hash.new{ |h, k| h[k]=0}
        self.each{|el| new_Hash[el]+=1 }
        return new_Hash
    end

    def my_count(value)
        return self.counts[value]
    end

    def my_index(value)
        return nil if self.include?(value)== false
        self.each.with_index do |el, i|
            if el==value
                return i
            end
        end
        return nil
    end

    def my_uniq
        uniq_els=[]
        self.each do |el|
            if !uniq_els.include?(el)
                uniq_els.push(el)
            end
        end
        return uniq_els
    end

    def my_transpose
        transposed2=[]
        i=0
        j=0
        while j< self.length
            i=0
            transposed1=[]
            while i< self.length
                    transposed1.push(self[i][j]
                i+=1
                end
            transposed2.push(transposed1)
            j+=1
        end
        transposed2
    end



end
