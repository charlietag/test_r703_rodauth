# try gem rodauth-rails
## enable module

```
# app/misc/rodauth_main.rb
enable :audit_logging
audit_log_message_for :login_failure do
  "Login failure on domain #{request.host}"
end
audit_log_metadata_for :login_failure do
  {'ip'=>request.ip}
end
```

```
rails g rodauth:migration audit_logging
```

```
rails g rodauth:views --all
```


# Try rodauth-rails

* rails g scaffold Book name author

* bundle add rodauth-rails

* rails g rodauth:install {table_name}
  * rails g rodauth:install users

```
Depending on your application's configuration some manual setup may be required:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

     * Required for all applications. *

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"

     * Not required for API-only Applications *

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <% if notice %>
         <div class="alert alert-success"><%= notice %></div>
       <% end %>
       <% if alert %>
         <div class="alert alert-danger"><%= alert %></div>
       <% end %>

     * Not required for API-only Applications *

  4. Titles for Rodauth pages are available via @page_title instance variable
     by default, you can use it in your layout file:

       <head>
         <title><%= @page_title || "Default title" %></title>
         ...
       </head>

    * Not required *

  5. You can copy Rodauth views (for customization) to your app by running:

       rails g rodauth:views # default bootstrap views

       rails g rodauth:views --css=tailwind # tailwind views (requires @tailwindcss/forms plugin)

      * Not required *
```

* Added files
  * app/misc/{rodauth_app.rb,rodauth_main.rb}
  * db/migrate/create_rodauth.rb
  * rails routes

# Try LDAP with rodauth-omniauth

* `bundle add rodauth-omniauth`
* `rails g migration create_user_identities`

  ```ruby
  class CreateUserIdentities < ActiveRecord::Migration[7.1]
    def change
      create_table :user_identities do |t|
        t.references :user, null: false, foreign_key: { on_delete: :cascade }
        t.string :provider, null: false
        t.string :uid, null: false
        t.index [:provider, :uid], unique: true

        t.timestamps
      end
    end
  end
  ```


