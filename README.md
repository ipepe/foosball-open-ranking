# foosball-open-ranking

[![Join the chat at https://gitter.im/ipepe/foosball-open-ranking](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/ipepe/foosball-open-ranking?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Ruby on Rails implementation of open ranking based on ELO

Website is hosted here:
<SOON>


# Kopiowanie backupu

```
scp 56cece0b7628e14d28000107@foos-ipepe.rhcloud.com:/var/lib/openshift/56cece0b7628e14d28000107/app-root/repo/db/data.yml ~/foosball_db_backup_2017-03-12.yml
```

# Reset rankingu

```
RAILS_ENV=production bundle exec rake players:rerank
```
