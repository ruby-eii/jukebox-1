FactoryGirl.define do
  factory :song do
    sequence(:name)   { |n| "AmazinSong #{n}" }
    sequence(:album)  { |n| "AmazingAlbum #{n}" }
    sequence(:artist) { |n| "AmazingArtist #{n}" }

    genre  [ "Rock", "Pop", "Blues", "Jazz", "Hip hop" ].sample
    year   Random.rand(1940..2015)
    length Random.rand(90..240)
    price  Random.rand(2.0..5.0)
  end
end
