docker run \
      --name ${PWD##*/}-db \
      -d \
      -e POSTGRES_USER=odoo \
      -e POSTGRES_PASSWORD=odoo \
      -e POSTGRES_DB=postgres \
      -v "$PWD/my-postgres.conf":/etc/postgresql/postgresql.conf \
      -v "$PWD/db":/var/lib/postgresql/data \
      postgres:11.1-alpine \
      -c 'config_file=/etc/postgresql/postgresql.conf'
#       -c 'shared_buffers=256MB'
#       -c 'max_connections=200'
docker run \
      --link ${PWD##*/}-db:db \
      --name ${PWD##*/} \
      -d \
      -p 8011:8069 \
      -v "$PWD"/addons:/mnt/extra-addons \
      odoo:11.0



docker run -i --rm postgres:11.1-alpine cat /usr/local/share/postgresql/postgresql.conf.sample > my-postgres.conf

tail -f postgres-logarchive.log

