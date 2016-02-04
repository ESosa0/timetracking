class Project < ActiveRecord::Base
  has_many :entries
  validates :name, presence: true, uniqueness: true, length: {maximum: 30}, format: {without: /[^[:alnum:]]/}
  def self.iron_find(id)
    where(id: id).first
  end
  def clean_old
    date = Time.now.midnight - 1.week
    projects = Project.where("created_at < ?", date)
    projects.destroy_all
  end
end
