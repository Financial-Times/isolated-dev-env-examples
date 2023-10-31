
### Pre-requisites

1. Install devbox - see https://www.jetpack.io/devbox/docs/quickstart/#install-devbox

## Node Devbox Example

1. Sets up a devbox shell with ```nodejs@20```
2. Runs ```npm install```
3. Sets up Doppler secrets as environment variables

```bash
# Usage
cd examples/node
devbox shell
```

## Python Devbox Example

1. Sets up a devbox shell with ```python@3.10```
2. Activates a virtual environment
3. Runs ```python -m pip install -r requirements.txt``` 
4. Sets up Doppler secrets as environment variables

```bash
# Usage
cd examples/python
devbox shell
```

## Serverless Devbox Example

1. Sets up a devbox shell with ```python@3.10```, ```nodejs@20``` and ```serverless@3.34.0```
2. Activates a virtual environment
3. Runs ```python -m pip install -r requirements.txt``` 
4. Sets up Doppler secrets as environment variables

```bash
# Usage
cd examples/sls
devbox shell
```

