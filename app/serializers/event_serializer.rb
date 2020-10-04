class EventSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :alloted_tickets, :sold_out_tickets, :start_date, :start_time, :image

  has_many :bookings
  has_many :users

  def start_date
    object.start_at.strftime("%d.%m.%Y")
  end

  def start_time
    object.start_at.strftime("%I:%M%p")
  end

  def image
    return unless object.image.attached?

    object.image.blob.attributes
          .slice('filename', 'byte_size')
          .merge(url: image_url)
          .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  def image_url
    url_for(object.image)
  end

end
