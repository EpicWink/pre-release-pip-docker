ARG _BASE

FROM $_BASE

RUN uname -a && cat /etc/issue && \
    apk --version && \
    python --version && pip --version && \

# Install Git
    apk add git && \

# Install pip
    pip install git+https://github.com/pypa/pip.git && \

# Install twine
    pip install git+https://github.com/pypa/twine.git && \

# Install build
    pip install git+https://github.com/pypa/build.git && \

# Remove Git and cleanup
    apk remove git && \
    apk clean
