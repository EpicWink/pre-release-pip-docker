# Pre-release pip testing Docker images
Test your Python packaging infrastructure with pre-releases of the packaging
tools by using these Docker images. These images are a drop-in replacement for
the `python:<tag>` images provided by Docker. Outside of the pre-release
window (14 days), release versions will be used instead.

Packages tracked:
* pip
* twine
* build

## Usage
### Examples
#### Building a Docker image
```docker
FROM epicwink/python-packaging-prerelease-testing:3.9-slim

ARG PIP_INDEX_URL
ADD . /opt/build-data
RUN pip install /opt/build-data
```

#### Running unit-tests
```shell
docker run --rm \
  -v $(pwd):/data -w /data \
  -e PIP_EXTRA_INDEX_URL \
  epicwink/python-packaging-prerelease-testing:3.10-alpine \
  sh -c 'pip install .[dev] && pytest'
```

#### Building and uploading a package
```shell
docker run --rm \
  -v $(pwd):/data -w /data \
  -e TWINE_REPOSITORY \
  -e TWINE_USERNAME \
  -e TWINE_PASSWORD \
  epicwink/python-packaging-prerelease-testing:latest \
  sh -c 'pyproject-build . && twine upload dist/*'
```


