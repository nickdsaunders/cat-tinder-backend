cats = [
  {
    name: 'Tom',
    age: 5,
    enjoys: 'Trying to catch Jerry.',
    img: 'https://www.thepitchkc.com/content/uploads/2020/11/a-cats-tale-astronaut.jpg'
  },
  {
    name: 'Stimpy',
    age: 30,
    enjoys: 'Earwax sandwiches.',
    img: 'https://creators-images.vice.com/content-images/contentimage/no-slug/dc6e3b6242af9531e992371799662dc0.jpg'
  },
  {
    name: 'Catdog',
    age: 7,
    enjoys: 'Being a cat and a dog at the same time.',
    img: 'https://public-media.si-cdn.com/filer/a0/15/a015251a-6a1d-449c-bf13-8c1c129c4cc5/egypt_kitty_mobile.jpg'
  }, 
  {
    name: 'Sylvester James Pussycat, Sr.',
    age: 50,
    enjoys: 'Chasing Tweety Bird, Speedy Gonzales, or Hippety Hopper.',
    img: 'https://images2.minutemediacdn.com/image/upload/c_fill,g_auto,h_1248,w_2220/f_auto,q_auto,w_1100/v1555344708/shape/mentalfloss/catartheader.jpg'
  }
]

cats.each do |attributes|
  Cat.create attributes
  puts "creating cat #{attributes}"
end

