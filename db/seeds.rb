cats = [
  {
    name: 'Tom',
    age: 5,
    enjoys: 'Tormenting Jerry.'
  },
  {
    name: 'Stimpy',
    age: 30,
    enjoys: 'Earwax sandwiches.'
  },
  {
    name: 'Catdog',
    age: 7,
    enjoys: 'Being a cat and a dog at the same time.'
  }
]

cats.each do |attributes|
  Cat.create attributes
  puts "creating cat #{attributes}"
end