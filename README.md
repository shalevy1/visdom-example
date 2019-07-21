# Visdom example

[Visdom](https://github.com/facebookresearch/visdom) is a tool for sharing visualizations.

## Setup the user interface

1. Use ssh tunnel to access server

```
ssh -L 8097:localhost:8097 gavinsvr
```

2. Activate the environment

```
pipenv shell
```

3. Setup up the visdom interface on Linux on the server

```
```

4. Visit the user-interface at http://localhost:5000/ on the desktop

## Install software

To install software manually

1. Install Python

```
pipenv --python 3.7
```

2. Install software

```
pipenv install visdom
```
