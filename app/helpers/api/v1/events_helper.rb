module Api::V1::EventsHelper
  def user_avatar_with_initials(username, classes: 'rounded-full')
    initials = username.split.map(&:chr).join.upcase[0..1]
    random_color = random_hex_color(username)

    content_tag(:div, class: 'relative') do
      content_tag(:div, initials, class: "#{classes} w-12 h-12 text-white font-bold flex justify-center border border-white items-center", style: "background-color: #{random_color};")
    end
  end

  def random_hex_color(name)
    hash_value = Digest::MD5.hexdigest(name)[0..5]
    "##{hash_value}"
  end

  def is_user_event(event, user)
    event.organizer.eql?(user)
  end
end
