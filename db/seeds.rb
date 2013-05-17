# admin = User.create!(
#   email: 'admin@example.com',
#   password: 'adminadmin',
#   password_confirmation: 'adminadmin',
#   full_name: 'Admin Istrator',
#   short_name: 'Operator'
# )
 
@mushroom_kingdom = Community.create!(
  name: 'Mushroom Kingdom',
  url: 'http://example.com'
)

@facets = Membership::FACETS.inject({}) do |h, facet|
  h.merge(facet.to_sym => Facet.create!(community: @mushroom_kingdom, name: facet))
end

@simple_facet = Facet.create!(community: @mushroom_kingdom, name: 'simple')

def mushroom_kingdom_member(options)
  user = User.create!(
    email: options.delete(:email),
    password: options[:password],
    password_confirmation: options.delete(:password),
    full_name: options[:name],
    short_name: options.delete(:name).split.first
  )

  dossier = @mushroom_kingdom.add_member(user)

  options.each do |key, value|
    Fact.create!( membership: dossier, facet: @facets.fetch(key), value: value)
  end

  dossier
end

mario = mushroom_kingdom_member(
  email: 'mario@example.com',
  password: 'mariomario',
  name: 'Mario Plumberman',
  title: 'Chief Plumbing Officer',
  avatar: 'http://media.tumblr.com/1da3c7ddd226b49f0e680773285b443f/tumblr_inline_mhs55yLJ5v1qz4rgp.png',
  bio: 'Mario is a Brooklyn-born plumber and co-owner of Mario Bros. Plumbing, their family business, along with his younger brother Luigi.',
  department: 'Adventure',
  twitter: 'mario',
  facebook: 'mario.the.plumber',
  github: 'mariocodes',
  phone: '(312) 555-1234',
)

luigi = mushroom_kingdom_member(
  email: 'luigi@example.com',
  password: 'luigiluigi',
  name: 'Luigi Plumberman',
  title: 'Executive Vice Plumber',
  avatar: 'http://images2.wikia.nocookie.net/__cb20080427231615/ssb/images/d/d3/LuigiBrawl.jpg',
  bio: %q(Luigi (Japanese: ルイージ) is Mario's younger, taller, thinner twin brother, and the deuteragonist of the Mario series. Luigi has helped and fought alongside his brother on many occasions. Throughout his life, he has lived in Mario's shadow, developing both cowardly and heroic tendencies.),
  department: 'Adventure',
  twitter: 'luigi',
  facebook: 'luigi.the.plumber',
  github: 'luigicodes',
  phone: '(312) 555-1234',
)

peach = mushroom_kingdom_member(
  email: 'peach@example.com',
  password: 'peachpeach',
  name: 'Princess Peach',
  title: 'Princess of Toadstool',
  avatar: 'https://dl.dropboxusercontent.com/u/12210925/mlpit-princess-peach.jpg',
  bio: %q(Princess Peach, originally called Princess Toadstool, sometimes referred to as Princess Peach Toadstool or simply Peach (Japanese: ピーチ姫) is the princess of the Mushroom Kingdom. Peach first appeared in Super Mario Bros.. She was created by Shigeru Miyamoto to be the damsel-in-distress throughout most Mario games. She resides in her castle along with many Toads. Her kingdom is often attacked by the Koopa Troop, led by Bowser.),
  department: 'Castle',
  twitter: 'princess_peach',
  facebook: 'princess.of.toadstool',
  github: 'peachcancode',
  phone: '(312) 555-1234',
)

Fact.create(
  facet: @simple_facet,
  membership: mario,
  author: luigi.user,
  value: %q(This man can stomp a goomba like you wouldn't believe!)
)

Fact.create(
  facet: @simple_facet,
  membership: mario,
  author: peach.user,
  value: %q(His moustache is so dreamy.)
)

Fact.create(
  facet: @simple_facet,
  membership: luigi,
  author: mario.user,
  value: %q(The best brother a guy could ask for, hands down.)
)

Fact.create(
  facet: @simple_facet,
  membership: luigi,
  author: peach.user,
  value: %q(Luigi is braver than you think; he's saved Mario more than once.)
)

Fact.create(
  facet: @simple_facet,
  membership: peach,
  author: mario.user,
  value: 'Peach makes the best cake in the whole world.'
)

Fact.create(
  facet: @simple_facet,
  membership: peach,
  author: luigi.user,
  value: 'I feel confident when Peach is around, thanks to her encouraging attitude.'
)
