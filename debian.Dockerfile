ARG _BASE

FROM $_BASE

RUN uname -a && cat /etc/issue && \
    apt-get --version && \
    python --version && pip --version && \

# Install Git
    apt-get update && \
    apt-get install --yes --no-install-recommended git && \

# Install pip
    pip install git+https://github.com/pypa/pip.git && \

# Install twine
    pip install git+https://github.com/pypa/twine.git && \

# Install build
    pip install git+https://github.com/pypa/build.git && \

# Remove Git and cleanup
    apt-get autoremove git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
