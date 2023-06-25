wget https://www.adminer.org/latest.php -O /var/www/html/adminer.php

chmod 777 /var/www/html/adminer.php

php -S 0.0.0.0:9090 /var/www/html/adminer.php
