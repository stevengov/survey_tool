# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

survey1 = Survey.create!(question: "Is Aang the Last Airbender?")
2.times { YesResponse.create!(survey: survey1) }

survey2 = Survey.create!(question: "Is Appa a flying dog?")
3.times { YesResponse.create!(survey: survey2) }
3.times { NoResponse.create!(survey: survey2) }

survey3 = Survey.create!(question: "Is Zuko's scar on his left side?")
4.times { YesResponse.create!(survey: survey3) }
2.times { NoResponse.create!(survey: survey3) }

survey4 = Survey.create!(question: "Is Toph deaf?")
YesResponse.create!(survey: survey4)
9.times { NoResponse.create!(survey: survey4) }

survey5 = Survey.create!(question: "Was there a film in 2010 called The Last Airbender?")
10.times { NoResponse.create!(survey: survey5) }

survey6 = Survey.create!(question: "Katara said 'That's rough buddy'")
2.times { YesResponse.create!(survey: survey6) }
7.times { NoResponse.create!(survey: survey6) }

survey7 = Survey.create!(question: "Did you cry during Leaves from the Vines?")
20.times { YesResponse.create!(survey: survey7) }
NoResponse.create!(survey: survey7)

Survey.create!(question: "Is the cabbage merchant the best character?")
