class Project < ActiveRecord::Base
  has_many :entries
  def self.iron_find(id)
    where(id: id).first
  end
  def clean_old
    date = Time.now.midnight - 1.week
    projects = Project.where("created_at < ?", date)
    projects.destroy_all
  end
end
