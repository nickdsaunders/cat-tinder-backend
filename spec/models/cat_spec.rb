require 'rails_helper'

RSpec.describe Cat, type: :model do
  it 'should have a valid name' do
    cat = Cat.create(age: 5, enjoys: 'chasing waterfalls')
    expect(cat.errors[:name]).to include "cant't be blank"
  end

  it 'should have a valid age' do
    cat = Cat.create(name: 'Paco', enjoys: 'chasing waterfalls')
    expect(cat.errors[:age]).to include "cant't be blank"
  end
  it 'should have a valid enjoys description' do
    cat = Cat.create(name: 'Paco', age: 5)
    expect(cat.errors[:enjoys]).to include "cant't be blank"
  end
  it 'should have an enjoys description with at least 10 chars' do
    cat = Cat.create(name: 'Paco', age: 5, enjoys: 'fish eating')
    expect(cat.errors[:enjoys]).to include "not enough characters, minimum of 10"
  end
  
end
