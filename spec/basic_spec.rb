require 'virtus/rom'

describe 'Including Virtus::ROM.model' do
  before do
    module Examples
      class User
        include Virtus::ROM.model

        attribute :name, String
        attribute :age,  Integer
      end
    end
  end

  it 'works' do
    expect { Examples::User.new(name:'Craig') }.not_to raise_exception
  end
end
