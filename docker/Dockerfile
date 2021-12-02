FROM platform-automation-image:5.0.19

# System Stuff
RUN apt-get -yq update && apt-get -yq install python3-venv wget nano vim gnupg2 less jq
# Python Stuff & ChaosTK CLI
RUN pip3 install --no-cache-dir -q -U pip setuptools
RUN pip3 install --no-cache-dir chaostoolkit
RUN pip3 install -U chaostoolkit-cloud-foundry

# ChaosTK Driver installs
RUN cd /root && mkdir git && cd git && git clone https://github.com/tmobile/chaostoolkit-turbulence.git && cd chaostoolkit-turbulence && python3 setup.py install
RUN cd /root && cd git && git clone https://github.com/tmobile/monarch.git && cd monarch && python3 setup.py install
RUN cd /root && cd git && git clone https://github.com/dav1dc-pcf/chaostk-experiments.git

# CF-CLI
RUN cd /root && wget -O cf-cli.tgz "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=6.53.0&source=github-rel" && tar -zxf cf-cli.tgz && mv -v cf /usr/local/bin/ && rm cf-cli.tgz

# Python Env Stuff
RUN echo "export LC_ALL=C.UTF-8" >> /root/.bashrc
RUN echo "export LANG=C.UTF-8" >> /root/.bashrc
RUN echo "export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt" >> /root/.bashrc

# k6
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69
RUN echo "deb https://dl.k6.io/deb stable main" | tee /etc/apt/sources.list.d/k6.list
RUN apt-get update
RUN apt-get install k6

