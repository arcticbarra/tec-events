class Event < ApplicationRecord
  before_create :generate_slug
  has_many :attendees

  def print_attendees
    csv = ''
    attendees.where('created_at >= ? AND created_at <= ?', start_at, end_at).each do |attendee|
      next if attendee.user.nil?
      csv << "#{attendee.user.name},#{attendee.user.email},#{attendee.user.major},#{attendee.user.semester}"
    end
    csv
  end

  private

  def generate_slug
    self.slug = name.parameterize
  end
end
