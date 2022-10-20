class LessonWord < ApplicationRecord
  belongs_to :lesson
  belongs_to :word
  belongs_to :word_answer

  scope :correct_answer, ->{joins(:word_answer)
    .where word_answers: {is_correct: true}}
end
