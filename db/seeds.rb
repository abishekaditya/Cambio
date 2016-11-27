# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(:email => 'nnn@gmail.com', :password => 'foobar', :password_confirmation => 'foobar', :username => 'abi', :name => 'abis')
User.create(:email => 'mmm@gmail.com', :password => 'foobar', :password_confirmation => 'foobar', :username => 'pul', :name => 'pulki')
User.create(:email => 'lll@gmail.com', :password => 'foobar', :password_confirmation => 'foobar', :username => 'sau', :name => 'saura')
User.create(:email => 'ooo@gmail.com', :password => 'foobar', :password_confirmation => 'foobar', :username => 'ayu', :name => 'ayus')
User.create(:email => 'ppp@gmail.com', :password => 'foobar', :password_confirmation => 'foobar', :username => 'man', :name => 'manis')
Group.create(:name => 'first', :admin => '1')
Group.create(:name => 'second', :admin => '2')
Group.create(:name => 'third', :admin => '1')
Group.create(:name => 'fourth', :admin => '5')
Group.create(:name => 'fifth', :admin => '4')
UserGroup.create(:user_id => 1, :group_id => 1)
UserGroup.create(:user_id => 2, :group_id => 2)
UserGroup.create(:user_id => 1, :group_id => 3)
UserGroup.create(:user_id => 5, :group_id => 4)
UserGroup.create(:user_id => 4, :group_id => 5)





