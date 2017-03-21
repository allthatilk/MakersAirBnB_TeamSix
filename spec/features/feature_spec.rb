feature 'adding a space' do
  scenario 'i can add a space' do
    visit "/"
    fill_in("name", with: "The Joy Room")
    fill_in("description", with: "The happiest room of all.")
    fill_in("price", with: "10")
    click_button "Create a new listing"
    expect(page).to have_content("The Joy Room")
  end
end

feature 'space availability' do
  scenario 'viewing a space\'s availability' do
    visit "/"
    fill_in("name", with: "The Joy Room")
    fill_in("description", with: "The happiest room of all.")
    fill_in("price", with: "10")
    click_button "Create a new listing"
    click_link "The Joy Room"
    expect(page).to have_content("Available Tonight!")
  end
end
