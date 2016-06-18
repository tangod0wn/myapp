module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user)

  	unless user
    identifier = Array.new(8) { ('a'..'z').to_a.sample }.join
    user = User.new(name: 'Anonymous', email_address: "#{identifier}@mailinator.com")
  end

    gravatar_id = Digest::MD5::hexdigest(user.email_address.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end