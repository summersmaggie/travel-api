class Seed

  def self.begin
    seed = Seed.new
    seed.generate_reviews
  end

  def generate_reviews
    20.times do |i|
      review = Review.create!(
        author: Faker::TwinPeaks.character,
        content: Faker::TwinPeaks.quote,
        destination: Faker::TwinPeaks.location
      )
      puts "Review #{i}: Author is #{review.author} and review is '#{review.content}'."
    end
  end
end

Seed.begin
