class Event < ApplicationRecord
  before_create :generate_slug

  private

  def generate_slug
    self.slug = name.parameterize
  end
end
