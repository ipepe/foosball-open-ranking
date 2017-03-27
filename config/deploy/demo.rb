set :branch, 'demo'

server 'localhost', port: 2300, roles: [:web, :app, :db], primary: true