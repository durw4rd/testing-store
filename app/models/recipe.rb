class Recipe < ActiveRecord::Base
  validates :name, :description, presence: true

  def calorie_bomb?
    calories > 800
  end

end
