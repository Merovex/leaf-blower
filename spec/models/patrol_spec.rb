# require 'spec_helper'
require 'rails_helper'

describe Patrol do
  # pending "add some examples to (or delete) #{__FILE__}"
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:rank) }
end
