# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'time'

i = 0
9.times do

    TalentReview.create do |talent_rev|
        talent_rev.reviews = Faker::TvShows::Seinfeld.quote
        talent_rev.talent_id = i
    end

    HostReview.create do |host_rev|
        host_rev.reviews = Faker::TvShows::GameOfThrones.quote
        host_rev.host_id = i
    end

    Talent.create do |talent|
        talent.user_name = Faker::Name.unique.name
        talent.dob = Time.now
        talent.fee = Faker::Number.between(100, 1000)
        talent.location = Faker::Nation.capital_city
        talent.talent_offered = Faker::Job.title

        j = 0
        9.times do
            talent.talent_review_id = j
            j+=1
        end

    end

    Host.create do |host|
        host.user_name = Faker::Name.unique.name
        host.dob = Faker::Date.birthday(48, 99)
        host.fee = Faker::Number.between(100, 1000)
        host.location = Faker::Nation.capital_city
        host.talent_needed = Faker::Job.title
        j = 0
        9.times do
            host.host_review_id = j
            j+=1
        end
    end

    i+=1

end