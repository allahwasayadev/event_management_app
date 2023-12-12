# frozen_string_literal: true

class FormModal < ViewComponent::Base
  attr_reader :event, :url, :method

  def initialize(event: nil, url: nil, method: nil)
    super
    @event = event
    @url = url
    @method = method
  end

end
