# Big O-ctopus and Biggest Fish
# A Very Hungry Octopus wants to eat the longest fish in an array of fish.

fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths

def sluggish_octopus(fishes)
    longest = ""
    fishes.each do |check_fish|
        fishes.each do |compare_fish|
            longest = check_fish if check_fish.length > compare_fish.length
        end
    end
    longest
end

p sluggish_octopus(fishes)


# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Complexity Demo. Remember that Big O is classified by the dominant term.

def dominant_octopus(fishes)
    sorted_fish = merge_sort(fishes)
    sorted_fish.last
end

def merge_sort(array)
  return array if array.length <= 1
  mid = array.length / 2
  left = array.take(mid)  
  right = array.drop(mid)
  merge(merge_sort(left), merge_sort(right))
end


def merge(left, right)
  sorted = []
  until left.empty? || right.empty?
    if left.first.length < right.first.length
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted + left + right
end


fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p dominant_octopus(fishes)

# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.

def clever_octopus(fishes)
    longest_fish = ""
    fishes.each { |fish| longest_fish = fish if fish.length > longest_fish.length }
    longest_fish
end

fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p clever_octopus(fishes)

# Dancing Octopus
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles in the following directions:

# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding tentacle. We can assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.

# Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.

def slow_dance(direction, tiles_array)
    tiles_array.each_with_index { |tile, index| return index if direction == tile }
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
p slow_dance("up", tiles_array) 
# > 0

p slow_dance("right-down", tiles_array)  
# > 3

# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.

new_tiles_data_structure = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7 }


def fast_dance(direction, tiles_hash)
    tiles_hash[direction]
end

p fast_dance("up", new_tiles_data_structure)
# > 0

p fast_dance("right-down", new_tiles_data_structure)
# > 3