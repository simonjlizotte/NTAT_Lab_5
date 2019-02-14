for i in 1..48
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  name = "#{first_name} #{last_name}"
  email = Faker::Internet.safe_email(name)

  user = User.new
  user.email = email
  user.name = first_name
  if user.save
    p "Saved user ##{i}: #{name} (#{email})"
    for ii in 1..48
      article = Article.new
      article.user = user
      article.title = Faker::Name.last_name
      article.content = Faker::Lorem.paragraph
      if article.save
        for iii in 1..10
          comment = Comment.new
          comment.user = user
          comment.article = article
          comment.message = Faker::Lorem.paragraph
          p "Micropost ##{ii} saved for #{name}"
          comment.save
        end
      else
        p article.errors
      end
    end
  else
    p user.errors
  end
end

