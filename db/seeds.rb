# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'

ApplicationRecord.transaction do 
  puts "Destroying tables..."
  # Unnecessary if using `rails db:seed:replant`
  Review.destroy_all
  Product.destroy_all
  User.destroy_all
  puts "Resetting primary keys..."
  # For easy testing, so that after seeding, the first `User` has `id` of 1
  ApplicationRecord.connection.reset_pk_sequence!('users')
  ApplicationRecord.connection.reset_pk_sequence!('products')
  ApplicationRecord.connection.reset_pk_sequence!('reviews')



  puts "Creating users..."
  # Create one user with an easy to remember username, email, and password:
  demo_user = User.create(
    first_name: 'Demo-lition',
    last_name: 'Last_name', 
    email: 'demo@user.io', 
    password: 'password'
  )


puts "Creating products..."
# OFFICIAL SEED DATA------------------------------------------------------------

thermal_keyboard = Product.create(
  name: 'THERMAL SEQ2 KEYBOARD',
  price: 420,
  description: 'SWITCHES, STABILISERS AND KEYCAPS ARE NOT INCLUDED!

  Switches/Stabilisers are offered in the THERMAL+ Starter Kit
  Plates [Extra]: https://ramaworks.store/products/thermal-seq2-plate
  The THERMAL is not compatible with the W01-A Internal Weight or W02-A Internal Dampener.

  The BEAM or ROSE plate (see configurations below) is already included with each THERMAL.

  Product Color Options:

  KURO (Black) with BEAM plate (polished aluminium)
  MOON (Grey) with BEAM plate (polished aluminium)
  ROSE (Rose Gold) with ROSE plate (polished aluminium)
  MILK (White) with BEAM plate (polished aluminium)
  SOYA (Cream) with BEAM plate (polished aluminium)
  PCB:

  The WT60-B PCB uses Kailh hotswap sockets for assembly without soldering.

  Finish:

  Beadblasted Anodized Aircraft-Grade Aluminium Body & Polished Anodized Aircraft-Grade Aluminium Plate
  The MILK and SOYA editions are Electrophoresis coated
  Interface:

  USB-C

  Weight (built - estimate):

  1500g

  Case Slope Angle:

  8.0°

  Features:

  Leaf Spring Mount, 1.5mm Aluminium Plate with 8 x 90mm x 1.5mm x 1.5mm leaf springs
  Hotswap PCB with In-Switch RGB LED
  PCB compatible with QMK firmware, configurable by VIA configurator
  PCB/plate mounting hardware for stable hotswap performance.
  Contents:

  1 x Top Enclosure (HHKB, Aluminium)
  1 x Base Enclosure (Aluminium)
  1 x Plate (BEAM or ROSE, Polished Aluminium)
  8 x RW Black M3x12 T10 Fixtures (Enclosure)
  8 x RW Black M2x4 T10 Fixtures (Daughterboard + Plate to top-housing)
  6 x RW Black M2x3 T10 Fixtures (Sub-assembly)
  6 x RW Black M2x3 CSK T6 Fixtures (Sub-assembly)
  6 x RW Black M2x3.5 Spacer (Sub-assembly)
  1 x wilba.tech WT60-B PCB
  1 x XO Switchpuller
  1 x RW T10 Torx Tool
  1 x RW T6 Torx Tool
  1 x Black Metal End USB-C to USB-A cable (USB 3.0) (Braided) - 1.5M
  1 x Set of PORON Foam Pads
  1 x Set of Feet
  1 x Instruction Booklet
  1 x Various Packaging'
)

thermal_keyboard_1 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/KEYBOARD_1.webp"),
  filename: "KEYBOARD_1.webp"
}

thermal_keyboard_2 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/KEYBOARD_2.webp"),
  filename: "KEYBOARD_1.webp"
}

thermal_keyboard.photos.attach([thermal_keyboard_1, thermal_keyboard_2])

#-------------------------------------------------------------------------------

duck_switches = Product.create(
  name: 'DUCK Switches',
  price: 16,
  description: 'In development for over the past six months, we are excited to 
  introduce our latest innovation - the DUCK switch. Working closely with our 
  manufacturing partners, we have translated our MUTE mounting platform 
  (found in the KARA, M60-B, M65-B and U80-B) into an MX switch. 
  The implementation acts as an elastic medium between the top and bottom 
  housing, thereby creating tighter tolerances. This will allow the switch 
  to have a deeper and consistent sound profile whilst eliminating the need 
  for switch-films.'
  )
  
duck_switches.photos.attach(
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/DUCK_SWITCHES.webp"), 
  filename: "DUCK_SWITCHES.webp"
)

#-------------------------------------------------------------------------------
  
grid_set_a = Product.create(
  name: 'GRID Set A Keycaps',
  price: 16,
  description: 'Injection moulded, low-profile keycaps produced by RAMA WORKS®. 
  Available in single colour sets (62 caps) or a mixed set (108 caps)'
)

grid_set_a_1 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/GRID_SET_A_PHOTO_1.webp"),
  filename: "GRID_SET_A_PHOTO_1.webp"
}

grid_set_a_2 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/GRID_SET_A_PHOTO_2.webp"),
  filename: "GRID_SET_A_PHOTO_2.webp"
}

grid_set_a_3 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/GRID_SET_A_PHOTO_3.webp"),
  filename: "GRID_SET_A_PHOTO_3.webp"
}

grid_set_a.photos.attach([grid_set_a_1, grid_set_a_2, grid_set_a_3])

#-------------------------------------------------------------------------------

grid_set_b = Product.create(
  name: 'GRID Set B Keycaps',
  price: 16,
  description: 'Injection moulded, low-profile keycaps produced by RAMA WORKS®. 
  Available in single colour sets (62 caps) or a mixed set (100 caps)'
)

grid_set_b_1 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/GRID_SET_B_PHOTO_1.webp"),
  filename: "GRID_SET_B_PHOTO_1.webp"
}

grid_set_b_2 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/GRID_SET_B_PHOTO_2.webp"),
  filename: "GRID_SET_B_PHOTO_2.webp"
}

grid_set_b_3 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/GRID_SET_B_PHOTO_3.webp"),
  filename: "GRID_SET_B_PHOTO_3.webp"
}

grid_set_b.photos.attach([grid_set_b_1, grid_set_b_2, grid_set_b_3])

#-------------------------------------------------------------------------------

grid_set_c = Product.create(
  name: 'GRID Set C Keycaps',
  price: 16,
  description: 'Injection moulded, low-profile keycaps produced by RAMA WORKS®. 
  Available in single colour sets (62 caps) or a mixed set of select 
  SET A / B / C caps (108 caps)'
)

grid_set_c_1 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/GRID_SET_C_PHOTO_1.webp"),
  filename: "GRID_SET_C_PHOTO_1.webp"
}

grid_set_c_2 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/GRID_SET_C_PHOTO_2.webp"),
  filename: "GRID_SET_C_PHOTO_2.webp"
}

grid_set_c_3 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/GRID_SET_C_PHOTO_3.webp"),
  filename: "GRID_SET_C_PHOTO_3.webp"
}

grid_set_c.photos.attach([grid_set_c_1, grid_set_c_2, grid_set_c_3])

#-------------------------------------------------------------------------------

kara_backplate = Product.create(
  name: 'KARA Backplate (Extra)',
  price: 16,
  description: 'NOTE: MATCHING BACKPLATE IS ALREADY INCLUDED WITH KARA. NOT COMPATIBLE WITH M60-A.'
)

kara_backplate_1 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/KARA_BACKPLATE_PHOTO_1.webp"),
  filename: "KARA_BACKPLATE_PHOTO_1.webp"
}

kara_backplate_2 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/KARA_BACKPLATE_PHOTO_2.webp"),
  filename: "KARA_BACKPLATE_PHOTO_2.webp"
}

kara_backplate_3 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/KARA_BACKPLATE_PHOTO_3.webp"),
  filename: "KARA_BACKPLATE_PHOTO_3.webp"
}

kara_backplate.photos.attach([kara_backplate_1, kara_backplate_2, kara_backplate_3])

#-------------------------------------------------------------------------------

kara_plate = Product.create(
  name: 'KARA Plate (Extra)',
  price: 16,
  description: 'NOTE: THE ICED PLATE IS ALREADY INCLUDED WITH KARA. NOT COMPATIBLE WITH M60-A. 
  KARA SUB-ASSEMBLY REQUIRES ALL 3 PARTS (PCB, MUTE, PLATE)

  Product Name:
  RAMA WORKS® KARA PLATE

  Part Number:
  RW-KARA-A-PLATE

  Material:
  Polycarbonate (NOCT, SOYA, ICED, AZUR, HAZE)

  Aluminium (MIST)'
)

kara_plate.photos.attach(
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/KARA_PLATE.webp"),
  filename: "KARA_PLATE.webp"
)

#-------------------------------------------------------------------------------

keycap = Product.create(
  name: 'WAVE SEQ2 Br Matte',
  price: 56,
  description: 'IN-STOCK - LIMITED RELEASE


  Product Name:

  RAMA WORKS® Br WAVE SEQ 2

  Part Number:

  RW-KC-Br-WAVE-SEQ2-01

  -------------------------------------------------------------------------------

  Product Description:

  The return of the LIQUID SERIES in the WAVE SEQ2 tactile keycap series by RAMA WORKS®.

  -------------------------------------------------------------------------------

  Product Color:
  GOLD / MOON

  Material:
  Brass

  Series:
  WAVE SEQ2

  Stem Type:
  Cherry MX

  Profile:
  Cherry Profile - Escape Row (R1)'
)

keycap_1 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/KEYCAP_PHOTO_1.webp"),
  filename: "KEYCAP_PHOTO_1.webp"
}

keycap_2 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/KEYCAP_PHOTO_2.webp"),
  filename: "KEYCAP_PHOTO_2.webp"
}
  
keycap_3 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/KEYCAP_PHOTO_3.webp"),
  filename: "KEYCAP_PHOTO_3.webp"
}

keycap.photos.attach([keycap_1, keycap_2, keycap_3])

#-------------------------------------------------------------------------------

m65_starter_kit = Product.create(
  name: 'M65-B Starter Kit',
  price: 38,
  description: 'Everything you need sans keycaps to make this a complete kit 
  with Aliaz 60g.'
)

m65_starter_kit.photos.attach(
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/M65_B_STARTER_KIT.webp"),
  filename: "M65_B_STARTER_KIT.webp"
)

#-------------------------------------------------------------------------------

m65_mute = Product.create(
  name: 'M65-B Mute (Extra)',
  price: 38,
  description: 'Extra MUTE mount for the M65-B, non-conductive silicone. 
  Need a spare? Making another plate? Moulded out of clear silicone to match 
  perfectly with the ICED variant.'
)

m65_mute.photos.attach(
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/M65_MUTE_PHOTO_1.webp"),
  filename: "M65_MUTE_PHOTO_1.webp"
)

#-------------------------------------------------------------------------------

m65_pcb = Product.create(
  name: 'M65-B PCB (Extra)',
  price: 88,
  description: 'In an effort to provide the best end-user experience available, 
  this M65-B PCB requires no soldering to construct with any Cherry 
  MX-compatible switches. The M65-B offers a USB-C connection attached to the 
  USB Extension PCB. The board includes in-switch RGB LEDs under the PCB, which 
  require no installation. PCB design by Wilba.
  
  The M65-Bx variant is a solderable version without hot-swap sockets for those 
  who are discerning with their switch choice.'
)

m65_pcb.photos.attach(
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/M65_PCB_PHOTO_1.webp"),
  filename: "M65_PCB_PHOTO_1.webp"
)

#-------------------------------------------------------------------------------

m65_plate = Product.create(
  name: 'M65-B Plate (Extra)',
  price: 52,
  description: 'Product Description:
  Extra plate for the M65-B, Mirror-finished PVD Coated Brass, Anodised Aluminium or Frosted Polycarbonate.

  -------------------------------------------------------------------------------

  Product Color Options:
  Brass: KURO (Black), MOON (Grey), MIST (Silver), ROSE
  Aluminium: KURO
  Polycarbonate: ICED

  Finish:
  Brass: Hand-polished Mirror finished PVD Coated Brass
  Aluminium: Beadblasted Anodised Aluminium
  Polycarbonate: Frosted

  -------------------------------------------------------------------------------

  Contents:

  1 x Plate (Brass OR Aluminium)

  6 x RW Black M2x3 T10 Fixtures

  6 x RW Black M2x3 CSK T6 Fixtures

  6 x RW Black M2x3.5 Spacer

  1 x Various Packaging

  -------------------------------------------------------------------------------'
)

m65_plate.photos.attach(
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/M65_PLATE_PHOTO_1.webp"),
  filename: "M65_PLATE_PHOTO_1.webp"
)

#-------------------------------------------------------------------------------

deskmat = Product.create(
  name: 'MAT',
  price: 24,
  description: 'DESCRIPTION: 
  
  We are excited to introduce our new MATS, available exclusively through RAMA WORKS®. This improved desk mat comes in four different colourways, perfect for matching any keyboard and desk setup combination.

  MATS is made out of an ultra-smooth, soft & sound absorbent material, measuring 300mm (W) x 720mm (L)  and a perfect thickness of 4mm (H), which is the same size as our much loved CANVAS XL.

  Machine Washable (wash on cold/gentle - air dry)
  Rubber foam base to ensure stability
  Stitched edge around the border for durability and prevent frayed edges
  Cloth Top - 100% polyester, which is soft to touch and perfect for your mouse to glide on'
)

deskmat_1 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/MATS_PHOTO_1.webp"),
  filename: "MATS_PHOTO_1.webp"
}

deskmat_2 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/MATS_PHOTO_2.webp"),
  filename: "MATS_PHOTO_2.webp"
}

deskmat_3 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/MATS_PHOTO_3.webp"),
  filename: "MATS_PHOTO_3.webp"
}

deskmat.photos.attach([deskmat_1, deskmat_2, deskmat_3])

#-------------------------------------------------------------------------------

microfiber = Product.create(
  name: 'RW ULTRASOFT XL MICROFIBER',
  price: 12,
  description: 'An XL-sized microfiber cloth. Great for wrapping your keyboard 
  in, cleaning your glasses or keeping handy in your bag. '
)

microfiber_1 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/MICROFIBER_PHOTO_1.webp"),
  filename: "MICROFIBER_PHOTO_1.webp"
}

microfiber_2 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/MICROFIBER_PHOTO_2.webp"),
  filename: "MICROFIBER_PHOTO_2.webp"
}

microfiber_3 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/MICROFIBER_PHOTO_3.webp"),
  filename: "MICROFIBER_PHOTO_3.webp"
}

microfiber.photos.attach([microfiber_1, microfiber_2, microfiber_3])

#-------------------------------------------------------------------------------

sweater = Product.create(
  name: 'SWEATER',
  price: 50,
  description: 'Styles:
  YOLK (TEAM EDITION): Puffy Heat Transfer Graphics
  KURO: Embroidered Graphics
  MOON: Embroidered Graphics

  Extras:
  Each comes packed in a RAMA WORKS® Dust Bag

  Material:
  95% Cotton
  5% Spandex

  Fleeced Lining',
  size: 'Medium'
)

sweater_1 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/SWEATER_PHOTO_1.webp"),
  filename: "SWEATER_PHOTO_1.webp"
}

sweater_2 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/SWEATER_PHOTO_2.webp"),
  filename: "SWEATER_PHOTO_2.webp"
}

sweater_3 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/SWEATER_PHOTO_3.webp"),
  filename: "SWEATER_PHOTO_3.webp"
}

sweater.photos.attach([sweater_1, sweater_2, sweater_3])

#-------------------------------------------------------------------------------

switchpuller = Product.create(
  name: 'Switchpuller XO SEQ2',
  price: 9,
  description: 'Product Description:
  The Switchpuller XO SEQ2 is now thicker to improve rigidity while still 
  removing switches with ease and precision. Now featured in the SOYA colourway 
  with a textured matte finish, classic laser-etched product code, and 
  relocated X and O cutouts.'
)

switchpuller_1 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/SWITCHPULLER_PHOTO_1.webp"),
  filename: "SWITCHPULLER_PHOTO_1.webp"
}

switchpuller_2 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/SWITCHPULLER_PHOTO_2.webp"),
  filename: "SWITCHPULLER_PHOTO_2.webp"
}

switchpuller.photos.attach([switchpuller_1, switchpuller_2])

#-------------------------------------------------------------------------------

team_cap = Product.create(
  name: 'TEAM CAP',
  price: 27,
  description: 'Featuring sandwich brim design with embroidered RAMA WORKS 
  branding across. The underside is laser-cut with X detail with signature 
  YOLK colouring beneath. Finished with a RAMA Logo embossed on the 
  rear-adjuster.'
)

team_cap_1 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/TEAMCAP_PHOTO_1.webp"),
  filename: "TEAMCAP_PHOTO_1.webp"
}

team_cap_2 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/TEAMCAP_PHOTO_2.webp"),
  filename: "TEAMCAP_PHOTO_2.webp"
}

team_cap_3 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/TEAMCAP_PHOTO_3.webp"),
  filename: "TEAMCAP_PHOTO_3.webp"
}

team_cap.photos.attach([team_cap_1, team_cap_2, team_cap_3])

#-------------------------------------------------------------------------------

team_shirt = Product.create(
  name: 'TEAM SHIRT',
  price: 35,
  description: 'Styles:
  KURO: Puffy Heat Transfer Graphics

  Extras:
  Each comes packed in a RAMA WORKS® Dust Bag

  Material:
  95% Cotton
  5% Spandex',
  size: 'medium'
)

team_shirt_1 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/TEAMSHIRT_PHOTO_1.webp"),
  filename: "TEAMSHIRT_PHOTO_1.webp"
}

team_shirt_2 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/TEAMSHIRT_PHOTO_2.webp"),
  filename: "TEAMSHIRT_PHOTO_2.webp"
}

team_shirt_3 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/TEAMSHIRT_PHOTO_3.webp"),
  filename: "TEAMSHIRT_PHOTO_3.webp"
}

team_shirt.photos.attach([team_shirt_1, team_shirt_2, team_shirt_3])

#-------------------------------------------------------------------------------

t_shirt = Product.create(
  name: "RAMA'S BURGERS T-SHIRT",
  price: 38,
  description: 'Material:
  Premium heavyweight soft 100% Cotton Tee.

  Silkscreened artwork.

  Made in Melbourne.'
)

t_shirt.photos.attach(
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/TSHIRT_PHOTO_1.webp"),
  filename: "TSHIRT_PHOTO_1.webp"
)
#-------------------------------------------------------------------------------

u80a = Product.create(
  name: 'U80-A SEQ2 Mute (Extra)',
  price: 45,
  description: 'Product Description:
  Extra MUTE mount for the U80-A, non-conductive silicone. Need a spare? Making another plate? '
)

u80a.photos.attach(
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/U80A_SEQ2_MUTE_PHOTO_1.webp"),
  filename: "U80A_SEQ2_MUTE_PHOTO_1.webp"
)

#-------------------------------------------------------------------------------

xo_cap = Product.create(
  name: 'XO CAP',
  price: 42,
  description: 'Styles:
  Featuring sandwich brim design with embroidered subtle black RAMA WORKS 
  branding across. Constructed entirely from our custom XO jacquard fabric. 
  And finished with the RAMA Logo debossed on the rear-adjuster.'
)

xo_cap_1 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/XO_CAP_PHOTO_1.webp"),
  filename: "XO_CAP_PHOTO_1.webp"
}

xo_cap_2 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/XO_CAP_PHOTO_2.webp"),
  filename: "XO_CAP_PHOTO_2.webp"
}

xo_cap_3 = {
  io: URI.open("https://zzyworks-dev.s3.us-west-1.amazonaws.com/XO_CAP_PHOTO_3.jpeg"),
  filename: "XO_CAP_PHOTO_3.jpeg"
}

xo_cap.photos.attach([xo_cap_1, xo_cap_2, xo_cap_3])

#-------------------------------------------------------------------------------

puts "Creating reviews..."
# REVIEWS SEEDS-----------------------------------------------------------------

review_1 = Review.create(
  title: "A good beginner/intermediate switch.",
  body: "I picked these up a few weeks ago, and since using them for awhile, I 
  like I have a good idea of how I like them. The sound profile is nice, not 
  too clacky, which I like, but also really smooth when bottoming out. The 
  springs are a bit too light for me, but it is still really fun to type on. 
  The yellow and clear housing looks sleek. Build quality is decent.",
  rating: 4,
  product_id: 1,
  user_id: 1
)

review_2 = Review.create(
  title: 'Not usually a fan, but these are great!',
  body: "I usually don't like linears that much, (Tactile gang!!) but these 
  switches are really nice to type on. It's consistent, feels great, and the 
  housing is really tight, so I did not have to film them to make them have 
  a more consistent sound profile. Grab some while they are in stock!",
  rating: 5,
  product_id: 1,
  user_id: 1
)

review_3 = Review.create(
  title: "Not sure if I got defects...",
  body: "The switches came delivered with really poor packaging. Not sure if 
  an intern was doing the packaging in the warehouse, but some of my switches 
  were damaged on delivery and it's really disappointing, especially since I 
  waited about 3 weeks for shipping/delivery.",
  rating: 2,
  product_id: 1,
  user_id: 1
)

puts "Done!"
end