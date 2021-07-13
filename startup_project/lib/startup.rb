require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name= name
        @funding= funding
        @salaries= salaries
        @employees= []
    end

    def valid_title?(title)
        if @salaries[title]
            return true
        else
            return false
        end
    end

    def>(another_startup)
        if @funding> another_startup.funding
            return true
        else
            return false
        end
    end

    def hire(employee_name, title)
        if @salaries[title]
            @employees << Employee.new(employee_name, title)
        else
            raise "Title is Invalid"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        pay= @salaries[employee.title]
        if @funding> pay
            employee.pay(pay)
            @funding-= pay
        else
            raise "Not Enough Funding"
        end
    end

    def payday
        @employees.each {|employee| self.pay_employee(employee)}
    end

    def average_salary
        sum=0
        @employees.each { |employee| sum+=@salaries[employee.title]}
        sum/@employees.length
    end

    def close
        @employees= []
        @funding= 0
    end

    def acquire(another_startup)
        @funding+= another_startup.funding
        @salaries= another_startup.salaries.merge(@salaries)
        @employees+= another_startup.employees
        another_startup.close
    end

















end
