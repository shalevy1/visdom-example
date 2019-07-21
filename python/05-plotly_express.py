from visdom import Visdom

try:
    vis = Visdom()
except Exception as err:
    print(type(err))
    print(err)
