class Waiter
    attr_reader :name, :yrs_xp
    @@all = []

    def initialize(name, yrs_xp)
        @name = name
        @yrs_xp = yrs_xp
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        best_tipped_meal = meals.max {|a, b| a.tip <=> b.tip}
        best_tipped_meal.customer
    end
end