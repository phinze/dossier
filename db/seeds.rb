admin = User.create!(
  email: 'admin@example.com',
  password: 'adminadmin',
  password_confirmation: 'adminadmin',
  full_name: 'Admin Istrator',
  short_name: 'Operator'
)

mushroom_kingdom = Community.create!(
  name: 'Mushroom Kingdom',
  url: 'http://example.com'
)

mushroom_kingdom.add_member(admin)

mario = User.create!(
  email: 'mario@example.com',
  password: 'mariomario',
  password_confirmation: 'mariomario',
  full_name: 'Mario Plumberman',
  short_name: 'Mario'
)

marios_dossier = mushroom_kingdom.add_member(mario)

mushroom_kingdom_avatar = Facet.create!(
  community: mushroom_kingdom,
  name: 'Avatar',
  klass: 'Facet::ImageURL',
  options: JSON.dump(width: 150)
)

mushroom_kingdom_bio = Facet.create!(
  community: mushroom_kingdom,
  name: 'Bio',
  klass: 'Facet::ImageURL',
  options: JSON.dump(width: 150)
)

Fact.create!(
  membership: marios_dossier,
  facet: mushroom_kingdom_avatar,
  value: 'http://media.tumblr.com/1da3c7ddd226b49f0e680773285b443f/tumblr_inline_mhs55yLJ5v1qz4rgp.png'
)


Fact.create!(
  membership: marios_dossier,
  facet: mushroom_kingdom_bio,
  value: 'Mario is a Brooklyn-born plumber and co-owner of Mario Bros. Plumbing, their family business, along with his younger brother Luigi.'
)


