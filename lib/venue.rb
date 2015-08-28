class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
end
before_save(:upcase_description)



  private

  def upcase_description
    self.description = description.upcase
  end
end
