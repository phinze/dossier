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

mushroom_kingdom_avatar = Facet.create(
  community: mushroom_kingdom,
  name: 'Avatar',
  klass: 'Facet::ImageURL',
  options: JSON.dump(width: 150)
)

marios_avatar = Fact.create!(
  membership: marios_dossier,
  facet: mushroom_kingdom_avatar,
  value: 'http://pt.board.goodgamestudios.com/gangster/image.php?u=357165&dateline=1365639526'
)
