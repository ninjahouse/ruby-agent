Given('context') do
  visit 'http://mark7.herokuapp.com'
end

When('event') do
  find('#login_form')
end

Then('outcome') do
  expect(page).to have_content 'Fazer Login no Mark7'
end
