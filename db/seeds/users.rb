# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  {
    name: 'Astro Nomical',
    description: 'Curious and always learning, Astro is always up for an adventure on the trail.',
    pronoun: 'they',
    image_url: 'Astro.png'
  },
  {
    name: 'SaaSy',
    description: 'Philosophy: Success. Not Software.',
    pronoun: 'they',
    image_url: 'Saasy.png'
  },
  {
    name: 'Codey',
    description: 'Codey likes to build things—he is a maker.',
    pronoun: 'he',
    image_url: 'Codey.png'
  },
  {
    name: 'Cloudy',
    description: 'Tech-savvy and smart, Cloudy builds innovative apps with the cloud.',
    pronoun: 'she',
    image_url: 'Cloudy.png'
  },
  {
    name: 'Hootie McOwlface',
    description: 'Wise. Has his nose in a book most of the time.',
    pronoun: 'he',
    image_url: 'Hootie.png'
  },
  {
    name: 'Einstein',
    description: 'Quick on his feet. Humble brilliance. Gets smarter with every interaction.',
    pronoun: 'he',
    image_url: 'Einstein.png'
  },
  {
    name: 'Earnie Badger',
    description: 'Quick and very clever. Grabbing badges as fast as she can.',
    pronoun: 'she',
    image_url: 'Earnie.png'
  },
  {
    name: 'Appy',
    description: 'An energetic and relatable bobcat, Appy is your guide to the Partner Ecosystem.',
    pronoun: 'she',
    image_url: 'Appy.png'
  },
  {
    name: 'Meta Moose',
    description: 'Meta Moose is a big picture thinker; he truly sees the forest for the trees.',
    pronoun: 'he',
    image_url: 'Moose.png'
  },
  {
    name: 'Koa the Dog',
    description: 'Incredibly resourceful, Koa the Dog truly represents what it means to have a friend by your side.',
    pronoun: 'he',
    image_url: 'Koa.png'
  },
  {
    name: 'Blaze',
    description: 'Blaze is your faithful, trusted companion, with you from the very start of your journey.',
    pronoun: 'she',
    image_url: 'Blaze.png'
  },
])
