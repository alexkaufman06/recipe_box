class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :categories
  # The above two lines are 'associatons'
  before_save(:capitalize_name)
  # Above is a 'callback'
  validates(:name, :presence => true)
  # Above is a 'validation'

  private

    def capitalize_name
      self.name=(name.capitalize)
    end
end
