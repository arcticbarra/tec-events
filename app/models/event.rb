class Event < ApplicationRecord
  before_create :generate_slug
  validates :slug, uniqueness: true
  has_many :attendees

  def print_attendees
    csv = ''
    attendees.where('created_at >= ? AND created_at <= ?', start_at, end_at).each do |attendee|
      next if attendee.user.nil?
      csv << "#{attendee.user.name},#{attendee.user.email},#{attendee.user.major},#{attendee.user.semester}"
    end
    csv
  end

  def link
    "https://tec-events.herokuapp.com/#{slug}/register"
  end

  private

  def generate_slug
    self.slug = name.parameterize + id.to_s
  end
end
