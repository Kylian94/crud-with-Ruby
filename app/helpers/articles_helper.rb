module ArticlesHelper
    def time_ago_in_words(from_time, options = {})
        distance_of_time_in_words(from_time, Time.now, options)
    end
end
