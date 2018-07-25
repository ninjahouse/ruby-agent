require 'mongo'

Given('context') do
  visit 'http://mark7.herokuapp.com'
end

When('event') do
  find('#login_form')
end

Then('outcome') do
  expect(page).to have_content 'Fazer Login no Mark7'
    
  srt_conn = 'mongodb://aluno:qaninja@ds225078.mlab.com:25078/heroku_4m3km28x'
  client = Mongo::Client.new(srt_conn)

  tasks = client[:tasks]
  tasks.delete_many(title: 'Livro')
end
