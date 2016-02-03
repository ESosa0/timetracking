class Entry < ActiveRecord::Base
  validates :hours, presence: true, numericality: true
  validates :minutes, presence: true, numericality: true
  validates :date, presence: true, 
  validates :project, presence: true,  
  belongs_to :project
end
