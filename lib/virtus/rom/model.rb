module Virtus::ROM::Model
  def self.included(base)
    base.send(:include, Virtus.model)
  end
end
