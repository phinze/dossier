admin = User.create!(
  email: 'admin@example.com',
  password: 'adminadmin',
  password_confirmation: 'adminadmin',
  full_name: 'Admin Istrator',
  short_name: 'Operator'
)

example_community = Community.create!(
  name: 'Example Community',
  url: 'http://example.com'
)

example_community.add_member(admin)
