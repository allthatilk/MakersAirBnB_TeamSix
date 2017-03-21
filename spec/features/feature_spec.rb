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
