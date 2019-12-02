require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  it{ should validate_presence_of(:login) }
  it{ should validate_presence_of(:password_digest) }
end
