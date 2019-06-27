# == Schema Information
#
# Table name: responses
#
#  id              :bigint           not null, primary key
#  user_id         :integer          not null
#  answerchoice_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Response < ApplicationRecord 
  validates :user_id, :answerchoice_id, presence: true 

  belongs_to :respondent,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User 

 
  belongs_to :answer_choice,
  primary_key: :id,
  foreign_key: :answerchoice_id,
  class_name: :AnswerChoice

  has_one :question, 
    through: :answer_choice,
    source: :question 

  def sibling_responses
    self.question.responses.where.not(id: self.id) 
  end

  def respondent_already_answered?
    self.sibling_response.exists?(user_id: self.user_id)
  end

  

end 
