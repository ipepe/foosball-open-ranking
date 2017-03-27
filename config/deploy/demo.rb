set :branch, 'demo'

server 'localhost', port: 2302, roles: [:web, :app, :db], primary: true