class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         after_create :load_todos
         has_many :todos
         has_many :tasks, through: :todos


         private

         def load_todos
            Task.all.each do |task|
            Todo.create(task: task, user: self)
          end
        end
end
