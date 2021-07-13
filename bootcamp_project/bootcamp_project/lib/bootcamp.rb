class Bootcamp

    def initialize(name, slogan, student_capacity)
        @name= name
        @slogan= slogan
        @student_capacity= student_capacity
        @students=[]
        @teachers=[]
        @grades= Hash.new{|h,k| h[k] = []}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(teacher)
        @teachers<< teacher
    end

    def enroll(student)
        if students.count< student_capacity
            @students<< student
            return true
        else
            false
        end
    end

    def enrolled?(student)
        students.include?(student)
    end

    def student_capacity
        @student_capacity
    end

    def student_to_teacher_ratio
        students.count/teachers.count
    end

    def add_grade(student, grade)
        if self.enrolled?(student)
                @grades[student]<< grade
            return true
        else
            return false
        end
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        return @grades[student].sum/@grades[student].length if self.enrolled?(student) && @grades.length>0
        nil
    end
end
