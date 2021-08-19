class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        (self.freebies.find_by(item_name: item_name) ? true : false)
    end

    def give_away(dev, freebie)
        update_freebie = Freebie.find(freebie.id)
        update_freebie.update(dev_id: dev.id)
    end
end
