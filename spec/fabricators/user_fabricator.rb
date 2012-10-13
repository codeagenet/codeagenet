Fabricator(:user) do
  email do
    sequence(:email) { |i| "#{i}-#{Faker::Internet.email}" }
  end

  password 'password'
  password_confirmation 'password'
end
