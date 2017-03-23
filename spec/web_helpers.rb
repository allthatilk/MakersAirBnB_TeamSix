def sign_up(email = 'test@test.com', password = 'password')
  visit '/users/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign up'
end

def sign_in(email = 'test@test.com', password = 'password')
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

def create_joy_room_listing
  fill_in("name", with: "The Joy Room")
  fill_in("description", with: "The happiest room of all.")
  fill_in("price", with: "10")
  fill_in("url", with: "http://img.clipartall.com/pokemon-clipart-image-poke-clipart005.jpg")
  click_button "Create a new listing"
end

def create_jims_room_listing
  fill_in("name", with: "Jim's Room")
  fill_in("description", with: "The saddest room of all.")
  fill_in("price", with: "100")
  click_button "Create a new listing"
end
