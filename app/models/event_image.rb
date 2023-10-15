# frozen_string_literal: true

class EventImage
  EVENT_ID = "2023"
  IMAGE_RANGE = 1..173
  PARENT_DIR = "2023-event"
  TYPE_DIRS = {
    thumb: "thumbs",
    original: "originals",
    preview: "previews",
    resized: "resized"
  }

  TALL_IDS = [1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 13, 14, 15, 18, 20, 21,
    22, 36, 37, 38, 42, 43, 44, 45, 57, 58, 59, 60, 61, 62,
    63, 64, 67, 68, 70, 71, 72, 75, 76, 77, 78, 79, 84, 86,
    88, 89, 90, 92, 93, 104, 105, 106, 107, 108, 114, 115,
    116, 117, 118, 120, 121, 122, 24, 128, 133, 134, 142,
    143, 144, 145, 146, 147, 148, 149, 152, 153, 154, 155,
    156, 157, 159, 160, 161, 166, 169, 170, 171, 173]

  class NotFoundError < StandardError; end

  attr_reader :id

  def initialize(id)
    @id = id
  end

  def anchor_id
    "event-image-#{EVENT_ID}-#{padded_id}"
  end

  def self.find(id)
    return unless IMAGE_RANGE.include? id

    new(id)
  end

  def self.find!(id)
    raise NotFoundError, "Invalid EventImage ID (#{id})" unless IMAGE_RANGE.include? id

    new(id)
  end

  def self.all
    IMAGE_RANGE.map { |id| new(id) }
  end

  def thumb_url
    return unless valid?

    url type: :thumb
  end

  def original_url
    return unless valid?

    url type: :original
  end

  def preview_url
    return unless valid?

    url type: :preview
  end

  def resized_url
    return unless valid?

    url type: :resized
  end

  def valid?
    IMAGE_RANGE.include? @id
  end

  def thumb_width
    return 133 if tall?

    200
  end

  def thumb_height
    return 200 if tall?

    133
  end

  private

  def tall?
    TALL_IDS.include? @id
  end

  def padded_id
    "0" * (3 - @id.to_s.size) + @id.to_s
  end

  def url(type:)
    "#{domain}/#{PARENT_DIR}/#{TYPE_DIRS.fetch(type)}/#{padded_id}.jpg"
  end

  def domain
    ENV.fetch("IMAGE_HOST_URL", "http://localhost")
  end
end
