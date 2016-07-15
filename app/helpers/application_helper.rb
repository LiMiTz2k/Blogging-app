module ApplicationHelper
  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def user_handler(options = {})
    if options[:user].present?
      user_name = options[:user].username
      "@#{user_name}"
    elsif options[:post].present?
      i = options[:post].user_id
      user = User.find_by(id: i)
      user_name = user.username
      "@#{user_name}"
    end
  end

  def embedded_svg(filename, options = {})
    assets = Rails.application.assets
    file = assets.find_asset(filename).source.force_encoding("UTF-8")
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css "svg"
    if options[:class].present?
      svg["class"]= options[:class]
    end
    raw doc
  end

end
