class Problem < ActiveRecord::Base
  acts_as_taggable

  belongs_to :user
  belongs_to :language
  belongs_to :license
  belongs_to :kind
  has_many :answers

  validates_presence_of :title,
                        :description,
                        :kind,
                        :language,
                        :license,
                        :user,
                        :bounty

  def self.increment_view_by_id(id)
    problem = self.find(id)
    problem.view += 1
    problem.save
  end

  def solved?
    !!correct_answer
  end

  def correct_answer
    Answer.find(:first,
      :conditions => ['problem_id = ? AND correct = TRUE', id])
  end

  def solver
    correct_answer.user
  end
end