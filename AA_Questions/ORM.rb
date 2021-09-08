require 'sqlite3'
require 'singleton'

class QuestionsDatabase< SQLite3::Database
    include Singleton
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Question

    attr_accessor :id, :title, :body, :author

    def initialize(options)
        @id = options[id]
        @title= options[title]
        @body = options[body]
        @author= options[author]
    end

    def self.find_by_id(id)
        options= QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL
        return Question.new(options)
    end

    def self.find_by_author_id(id)
        option= QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            questions
        WHERE
            author = ?
        SQL

        return Question.new(options)
    end


end

class User

    attr_accessor :id, :fname, :lname

    def initialize(options)
        @id= options[id]
        @fname= options[fname]
        @lname= options[lname]
    end

    def self.find_by_id(id)
        options= QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            users
        WHERE
            id =?
        SQL
        return User.new(options)
end

class Reply

    attr_accessor :id, :question, :parent, :user, :body

    def initialize(options)
        @id= options[id]
        @question= options[question]
        @parent= options[parent]
        @user= options[user]
        @body= options[body]
    end

    def self.find_by_id(id)
        options= QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            users
        WHERE
            id =?
        SQL
        return Reply.new(options)
end

end
