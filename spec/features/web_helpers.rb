def create_joy_room_listing
  fill_in("name", with: "The Joy Room")
  fill_in("description", with: "The happiest room of all.")
  fill_in("price", with: "10")
  click_button "Create a new listing"
end

def create_jims_room_listing
  fill_in("name", with: "Jim's Room")
  fill_in("description", with: "The saddest room of all.")
  fill_in("price", with: "100")
  click_button "Create a new listing"
end
