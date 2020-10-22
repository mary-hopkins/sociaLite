# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Creating Users
lucy = User.new(
    :email                 => "lucy@example.com",
    :password              => "foobar",
    :password_confirmation => "foobar"
)
lucy.save

profile = lucy.build_profile()
profile.name = "Lucy"
profile.birthday = "2010-10-27"
profile.location = "New York, New York"
profile.work = "Hudson Scenic"
profile.education = "North Valley High"
profile.relationship = "Single"
profile.interests = "Cats, water polo, the color blue"
profile.save

red = User.new(
    :email                 => "red@example.com",
    :password              => "foobar",
    :password_confirmation => "foobar"
)
red.save

profile = red.build_profile()
profile.name = "Red"
profile.birthday = "2010-10-08"
profile.location = "El Paso, Texas"
profile.work = "Blood Moon Ranch"
profile.education = "Red Plains High"
profile.relationship = "Complicated"
profile.interests = "Cherries, fire and bright Red Dawns"
profile.save

blue = User.new(
    :email                 => "blue@example.com",
    :password              => "foobar",
    :password_confirmation => "foobar"
)
blue.save

profile = blue.build_profile()
profile.name = "Blue"
profile.birthday = "2010-08-08"
profile.location = "Anchorage, Alaska"
profile.work = "Ice Fishing Inc."
profile.education = "Anchorage High"
profile.relationship = "Single"
profile.interests = "Ice, Space and the deepest water on Earth"
profile.save

green = User.new(
    :email                 => "green@example.com",
    :password              => "foobar",
    :password_confirmation => "foobar"
)
green.save

profile = green.build_profile()
profile.name = "Green"
profile.birthday = "2010-06-08"
profile.location = "Jackson County, Missouri"
profile.work = "Organic Farms"
profile.education = "Gateway High"
profile.relationship = "Single"
profile.interests = "Grass, Sea Glass and rolling fields of Green"
profile.save

yellow = User.new(
    :email                 => "yellow@example.com",
    :password              => "foobar",
    :password_confirmation => "foobar"
)
yellow.save

profile = yellow.build_profile()
profile.name = "Yellow"
profile.birthday = "2009-06-08"
profile.location = "Sun City, Oklahoma"
profile.work = "Sunshine Farms"
profile.education = "Sun City High School"
profile.relationship = "Married"
profile.interests = "Birds, Bees and sunlight through the trees"
profile.save