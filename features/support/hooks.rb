Before do
  page.current_window.resize_to(1440, 900)
end

After do |scenario|
  nome_cenario = scenario.name.gsub(/[^A-Za-z0-9 ]/, '')
  nome_cenario = nome_cenario.tr(' ', '_').downcase!
  screenshot = "log/screenshots/#{nome_cenario}.png"

  page.save_screenshot(screenshot)
  embed(screenshot, 'image/png', 'Evidência')
end
