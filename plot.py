import matplotlib.pyplot as plt
import numpy as np
import math


def plot(data, bin_size, chart_name):
    # Calculate the bin edges
    data = np.array(data)
    left_tick = math.floor(data.min() / bin_size) * bin_size
    bin_edges = np.arange(left_tick, data.max() + bin_size, bin_size)
    # bin_edges = np.arange(data.min(), data.max() + bin_size, bin_size)

    # Create a histogram of the data
    hist, bin_edges = np.histogram(data, bins=bin_edges)

    # Calculate the bar positions and widths
    bar_positions = (bin_edges[:-1] + bin_edges[1:]) / 2
    bar_widths = bin_size * 0.9

    # Create a bar chart
    fig, ax = plt.subplots()
    ax.bar(bar_positions, hist, width=bar_widths, align="center")

    # Set the chart title and axis labels
    ax.set_title(f"{chart_name} Distribution")
    ax.set_xlabel(f"{chart_name}")
    ax.set_ylabel("Frequency")

    # Set the x-axis tick values and labels

    x_ticks = np.arange(int(left_tick), int(data.max()) + 1, bin_size)
    # x_ticks = np.arange(int(data.min()), int(data.max()) + 1, bin_size)

    ax.set_xticks(x_ticks)
    ax.set_xticklabels(x_ticks.astype(int))

    # Set the y-axis tick values and labels
    y_ticks = np.arange(0, max(hist) * 1.3, max(hist) // 5 + 1)
    ax.set_yticks(y_ticks)
    ax.set_yticklabels(y_ticks.astype(int))

    # Add labels for the bar frequencies
    for x, y in zip(bar_positions, hist):
        label = "{:.0f}".format(y)
        ax.annotate(
            label,
            xy=(x, y),
            xytext=(0, 5),
            textcoords="offset points",
            ha="center",
            va="bottom",
        )

    # Show the chart
    plt.show()
