# Enter your code here. Read input from STDIN. Print output to STDOUT
require 'pry'
###
# To return the combined expertise of the two-man team
###
def getTeamExpertise(t1,t2)
    expertise = []
    t1.size.times do |i|
        if t1[i] == 1 or t2[i] == 1
            expertise << 1
        else
            expertise << 0
        end
    end
    return expertise    
end

# Return the maximum team expertise for pairs of two and number of such pairs possible.
def maxTeamExpertise(people)
    max_expertise = []
    max_topics = 0 # track the maximum number of topics covered by a team
    binding.pry
    for i in 0..people.size-2
        m1 = people[i]
        for j in 1..people.size-1
            m2 = people[j]
            team_expertise = getTeamExpertise(m1,m2) # get the expertise of the team
            count = 0
            team_expertise.each do |i|
                count += 1 if i == 1
            end
            if count >= max_topics
                if count == max_topics
                    max_expertise << team_expertise # push the team to max_expertise team's array
                else
                    # Reset max_topics and max_expertise array
                    max_topics = count
                    max_expertise = [team_expertise]
                end
            end
        end
    end
    # printing to STDOUT
    puts max_topics
    puts max_expertise.size
end

# Read the input from STDIN
input = gets.chomp
input = input.split
people_count = input.first.to_i
topics_count = input[1].to_i
people = []
# Get the input of each persons topic coverage into a people's array
people_count.times do
    expertise = gets.chomp.to_i
    people << expertise
end
# Find the maximum team expertise
maxTeamExpertise(people)