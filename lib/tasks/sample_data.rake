namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    admin = User.create!(name: "Admin",
                         email: "unix1983@gmail.com",
                         password: "rubyonrails",
                         password_confirmation: "rubyonrails")
    admin.toggle!(:admin)

  end
end
