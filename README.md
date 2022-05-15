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
