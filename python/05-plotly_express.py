from visdom import Visdom

import matplotlib.pyplot as plt
import seaborn as sns
import plotly.express as px


def get_server(env):
    viz = Visdom(env=env)

    assert viz.check_connection(timeout_seconds=3), \
        'No connection could be formed quickly'
    return viz


def main():
    viz = get_server('test2')

    # display text
    viz.text('hello2')

    # display matplotlib plot
    fig, ax = plt.subplots()
    ax.plot([1, 23, 2, 4])
    ax.set_ylabel('some numbers')
    fig.suptitle('Matplotlib plot')
    viz.matplot(fig)

    fig, ax = plt.subplots()
    tips = sns.load_dataset("tips")
    sns.relplot(x="total_bill", y="tip", data=tips, ax=ax)
    fig.suptitle('Seaborn plot')
    viz.matplot(fig)

    iris = px.data.iris()
    fig = px.scatter(
        iris, x="sepal_width", y="sepal_length")
    viz.plotlyplot(fig)


if __name__ == '__main__':
    main()
