# Add devise to gemfile

```
rails new --webpack=react jira

./bin/rails generate devise:install
./bin/rails generate devise user
./bin/rails db:migrate
./bin/rails g scaffold bug user:references description:text priority:integer color:string title:string due_date:datetime
```

# In layout/application.html.erb add:

```
  <p class="notice"><%= notice %></p>
  <p class="alert"><%= alert %></p>
  <% if user_signed_in? %>
    <p>Welcome <%= current_user.email %></p>
  <% else %>
    <%= link_to "Signin", new_user_session_path %>
  <% end %>
```
