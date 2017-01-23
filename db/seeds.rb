# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pin.create!(
  [
    {
      latitude: -34.896654,
      longitude: -56.121117,
      status: 'busy'
    },
    {
      latitude: -34.896410,
      longitude: -56.121083,
      status: 'free'
    },
    {
      latitude: -34.896510,
      longitude: -56.121110,
      status: 'free'
    },
    {
      latitude: -34.895783,
      longitude: -56.119315,
      status: 'uncertain'
    },
    {
      latitude: -34.897085,
      longitude: -56.120388,
      status: 'uncertain'
    },
    {
      latitude: -34.903130,
      longitude: -56.131653,
      status: 'uncertain'
    },
    {
      latitude: -34.896408,
      longitude: -56.121085,
      status: 'free'
    },
    {
      latitude: -34.856230,
      longitude: -56.203514,
      status: 'free'
    },
    {
      latitude: -33.747384,
      longitude: -61.968903,
      status: 'free'
    },
    {
      latitude: -33.747420,
      longitude: -61.968603,
      status: 'free'
    },
    {
      latitude: -33.747884,
      longitude: -61.968270,
      status: 'free'
    },
    {
      latitude: -33.747929,
      longitude: -61.968688,
      status: 'free'
    },

  ]
)
