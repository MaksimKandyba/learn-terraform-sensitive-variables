FROM amazonlinux:2018.03.0.20230501.0

RUN yum install -y httpd24 php72
RUN usermod -a -G apache root
RUN chown -R root:apache /var/www
RUN chmod 2775 /var/www
RUN find /var/www -type d -exec chmod 2775 {} \;
RUN find /var/www -type f -exec chmod 0664 {} \;
RUN echo "hi from html" > /var/www/html/index.html
RUN printf "<?php\n  \$hi = \"hi from php\n\";\n  echo \$hi;\n?>" > /var/www/html/index.php
