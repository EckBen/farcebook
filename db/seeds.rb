# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

john = User.new(email: 'test1@example.com', 
  password: 'password123',
  password_confirmation: 'password123',
  first_name: 'John',
  last_name: 'Doe',
  username: 'johnDoe')
john.skip_confirmation!
john.save!

jeb = User.new(email: 'test2@example.com', 
  password: 'password123',
  password_confirmation: 'password123',
  first_name: 'Jeb',
  last_name: 'Doe',
  username: 'jebDoe')
jeb.skip_confirmation!
jeb.save!

joseph = User.new(email: 'test3@example.com', 
  password: 'password123',
  password_confirmation: 'password123',
  first_name: 'Joseph',
  last_name: 'Doe',
  username: 'josephDoe')
joseph.skip_confirmation!
joseph.save!

jane = User.new(email: 'test4@example.com', 
  password: 'password123',
  password_confirmation: 'password123',
  first_name: 'Jane',
  last_name: 'Doe',
  username: 'janeDoe')
jane.skip_confirmation!
jane.save!

jerry = User.new(email: 'test5@example.com', 
  password: 'password123',
  password_confirmation: 'password123',
  first_name: 'Jerry',
  last_name: 'Doe',
  username: 'jerryDoe')
jerry.skip_confirmation!
jerry.save!

jesus = User.new(email: 'test6@example.com', 
  password: 'password123',
  password_confirmation: 'password123',
  first_name: 'Jesus',
  last_name: 'Doe',
  username: 'jesusDoe')
jesus.skip_confirmation!
jesus.save!

joanna = User.new(email: 'test7@example.com', 
  password: 'password123',
  password_confirmation: 'password123',
  first_name: 'Joanna',
  last_name: 'Doe',
  username: 'joannaDoe')
joanna.skip_confirmation!
joanna.save!

jeffery = User.new(email: 'test8@example.com', 
  password: 'password123',
  password_confirmation: 'password123',
  first_name: 'Jeffery',
  last_name: 'Doe',
  username: 'jefferyDoe')
jeffery.skip_confirmation!
jeffery.save!

###############################################################################################
## john will have:
#     friendships with- jeb, joseph, jane, jeffery
#     text_posts- 2
#     picture_posts- 2
#     in their profile- full
#     comments on- jebs posts
###############################################################################################

john.friendships.create(friend_id: jeb.id, pending: false)
john.friendships.create(friend_id: jane.id, pending: false)

# Pending friend request
john.friendships.create(friend_id: joseph.id)

john.text_posts.create(post_body: "John's first text post body. Lorem ipsum and all that.")
john.text_posts.create(post_body: "John's second text post body. I should really look into text generators.")

john.picture_posts.create(picture_title: "Meetings", picture_body: "Busy at my fancy business meeting.", picture_url: "https://images.pexels.com/photos/3182833/pexels-photo-3182833.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260")
john.picture_posts.create(picture_url: "https://images.pexels.com/photos/3182829/pexels-photo-3182829.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260")

john.create_profile(profile_pic_url: "https://images.pexels.com/photos/3182747/pexels-photo-3182747.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260", city: "Scranton", state: "PA", job: "Business", workplace: "Business office")

###############################################################################################
## jeb will have:
#     friendships with- john, joseph, jerry
#     text_posts- 1
#     picture_posts- 2
#     in their profile- pic only
#     comments on- johns posts
#     likes- johns first text_post and one top level comment and one child comment
###############################################################################################

jeb.friendships.create(friend_id: joseph.id, pending: false)
jeb.friendships.create(friend_id: jerry.id, pending: false)

jeb.text_posts.create(post_body: "Jeb's first text post body. Lorem ipsum and all that.")

jeb.picture_posts.create(picture_title: "The wonders of space.", picture_url: "https://images.pexels.com/photos/1257860/pexels-photo-1257860.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260")
jeb.picture_posts.create(picture_body: "I have always wanted to visit a forest like this. With all of the moss everywhere it looks like it would be a super comfy place to take a nap.", picture_url: "https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=750&w=1260")

jeb.create_profile(profile_pic_url: "https://images.pexels.com/photos/2102413/pexels-photo-2102413.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260")

###############################################################################################
## joseph will have:
#     friendships with- john, jeb
###############################################################################################

# Should be create by the other guys above

###############################################################################################
## jane will have:
#     friendships with- john
#     in their profile- everything but pic
#     comments on- one of johns comments and one of jebs comments
#     likes- jebs second picture_post and johns second picture_post
###############################################################################################

jane.create_profile(profile_pic_url: "https://images.pexels.com/photos/2405903/pexels-photo-2405903.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260", city: "Wilkes-Barre", state: "PA", job: "Mother", workplace: "My daughters' heart")

###############################################################################################
## jerry will have:
#     friendships with- jeb, jesus
#     comments on- all of janes comments
#     likes- all of the posts
###############################################################################################

jerry.friendships.create(friend_id: jesus.id, pending: false)

###############################################################################################
## jesus will have:
#     friendships with- jerry
#     comments on- all of jerrys comments
#     likes- all of the comments
###############################################################################################

# No action required

###############################################################################################
## joanna will have:
#     nothing
###############################################################################################

# No action required

###############################################################################################

###############################################################################################
## jeffery will have:
#     friendship with- john
###############################################################################################

jeffery.friendships.create(friend_id: john.id, pending: false)

###############################################################################################

###############################################################################################
## Likes and comments, separated to create in proper order

#     john comments on- jebs posts
john.comments.create(commentable_type: "TextPost", commentable_id: jeb.text_posts.first.id, comment_body: "Couldn't agree more, good buddy.")
john.comments.create(commentable_type: "PicturePost", commentable_id: jeb.picture_posts.first.id, comment_body: "That would be fantastic.")
john.comments.create(commentable_type: "PicturePost", commentable_id: jeb.picture_posts.last.id, comment_body: "Love it!")

#     jeb comments on- johns posts
jeb.comments.create(commentable_type: "TextPost", commentable_id: john.text_posts.first.id, comment_body: "What is this? Why did you bother posting it?!")
jeb.comments.create(commentable_type: "TextPost", commentable_id: john.text_posts.last.id, comment_body: "Or have an original idea for a change.")
jeb.comments.create(commentable_type: "PicturePost", commentable_id: john.picture_posts.first.id, comment_body: "That looks really boring.")
jeb.comments.create(commentable_type: "PicturePost", commentable_id: john.picture_posts.last.id, comment_body: "Stop taking selfies dude.")

#     jane comments on- one of johns comments and pic_posts and one of jebs comments and pic_posts
jane.comments.create(commentable_type: "PicturePost", commentable_id: jeb.picture_posts.last.id, comment_body: "That nebula is sus.")
jane.comments.create(commentable_type: "PicturePost", commentable_id: john.picture_posts.last.id, comment_body: "Wattacutie")
jane.comments.create(commentable_type: "Comment", commentable_id: jeb.comments.last.id, comment_body: "But he's a stud!")
jane.comments.create(commentable_type: "Comment", commentable_id: john.comments.last.id, comment_body: "Wanna play Among Us?")

#     jerry comments on- all of janes comments
jerry.comments.create(commentable_type: "Comment", commentable_id: jane.comments.first.id, comment_body: "Nebula was not the imposter.")
jerry.comments.create(commentable_type: "Comment", commentable_id: jane.comments.last.id, comment_body: "What about me?!?!")

#     jesus comments on- all of jerrys comments
jesus.comments.create(commentable_type: "Comment", commentable_id: jerry.comments.first.id, comment_body: "Still haven't played that game.")
jesus.comments.create(commentable_type: "Comment", commentable_id: jerry.comments.last.id, comment_body: "Jerry chill. She broke up with you what...like two years ago?")


#     jeb likes- johns first text_post and one top level comment and one child comment
jeb.likes.create(likeable_type: "TextPost", likeable_id: john.text_posts.first.id)
jeb.likes.create(likeable_type: "Comment", likeable_id: jane.comments.first.id)
jeb.likes.create(likeable_type: "Comment", likeable_id: jerry.comments.first.id)

#     jane likes- jebs second picture_post and johns second picture_post
jane.likes.create(likeable_type: "PicturePost", likeable_id: john.picture_posts.last.id)
jane.likes.create(likeable_type: "PicturePost", likeable_id: jeb.picture_posts.last.id)

#     jerry likes- all of the posts
jerry.likes.create(likeable_type: "TextPost", likeable_id: john.text_posts.first.id)
jerry.likes.create(likeable_type: "TextPost", likeable_id: john.text_posts.last.id)
jerry.likes.create(likeable_type: "TextPost", likeable_id: jeb.text_posts.first.id)
jerry.likes.create(likeable_type: "PicturePost", likeable_id: john.picture_posts.first.id)
jerry.likes.create(likeable_type: "PicturePost", likeable_id: john.picture_posts.last.id)
jerry.likes.create(likeable_type: "PicturePost", likeable_id: jeb.picture_posts.first.id)
jerry.likes.create(likeable_type: "PicturePost", likeable_id: jeb.picture_posts.last.id)

#     jesus likes- all of the comments
jesus.likes.create(likeable_type: "Comment", likeable_id: 1)
jesus.likes.create(likeable_type: "Comment", likeable_id: 2)
jesus.likes.create(likeable_type: "Comment", likeable_id: 3)
jesus.likes.create(likeable_type: "Comment", likeable_id: 4)
jesus.likes.create(likeable_type: "Comment", likeable_id: 5)
jesus.likes.create(likeable_type: "Comment", likeable_id: 6)
jesus.likes.create(likeable_type: "Comment", likeable_id: 7)
jesus.likes.create(likeable_type: "Comment", likeable_id: 8)
jesus.likes.create(likeable_type: "Comment", likeable_id: 9)
jesus.likes.create(likeable_type: "Comment", likeable_id: 10)
jesus.likes.create(likeable_type: "Comment", likeable_id: 11)


#### Next step would be to write tests to make sure I can access all this data through associations
#### Also write tests to make sure record creation works properly since this is all hard coded