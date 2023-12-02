import plotly.graph_objects as go
from datetime import datetime, timedelta
import db_parser as db
import os
import csv


d=5
def get_i():
    global d
    i=d
    d=d+5
    return i




    
def date_range(start_date, end_date):
    start_date = datetime.strptime(start_date, "%Y-%m-%d")
    end_date = datetime.strptime(end_date, "%Y-%m-%d")

    date_list = []
    current_date = start_date
    while current_date <= end_date:
        date_list.append(current_date.strftime("%m.%d"))
        current_date += timedelta(days=1)

    return date_list





def return_graph(start_date='2023-01-26', end_date='2023-11-06', product_name='Iphone 14 Case', category='sell'):
    x_os = []
    y_os = []
    x_line = date_range(start_date, end_date)
    x_weeks = []
    y_line= db.get_by_date(start_date, end_date, product_name, category)
    # y_line = [random.randint(5000, 11508) for _ in range(len(x_line))]
    y_weeks = []
    x_os = x_line
    y_os = y_line
    if len(x_line) > 75:
        i = 0
        while i < int(len(x_line) / 7):
            x_weeks.append(x_line[7 * i])
            total_sum = sum(y_line[7 * i: 7 * i + 7])
            y_weeks.append(total_sum / 7)
            i += 1
        x_os = x_weeks
        y_os = y_weeks

    fig = go.Figure()
    
    # Добавление светло-зеленого фона
    fig.add_trace(go.Scatter(x=x_os + x_os[::-1],
                             y=y_os + [0] * len(y_os),
                             fill='toself',
                             fillcolor='rgba(10, 119, 88, 1)',
                             line=dict(color='rgba(255, 255, 255, 0)'),
                             hoverinfo='none',
                             showlegend=False,
                             opacity=(1-1/len(y_os)*get_i())))

    # Добавление графика
    fig.add_trace(go.Scatter(x=x_os, y=y_os, mode='lines+markers', name='Data', line=dict(color='orange')))


    for x_val, y_val in zip(x_os, y_os):
        fig.add_trace(go.Scatter(x=[x_val], y=[y_val],
                                 mode='markers',
                                 marker=dict(size=10, color='orange'),
                                 text=[f'Date: {x_val}<br>{category.capitalize()}: {y_val}'],
                                 hoverinfo='text',
                                 showlegend=False))

    # Настройка макета графика
    fig.update_layout(
        title="ANALYTICAL GRAPH",
        xaxis=dict(title='TIME'),
        yaxis=dict(title=category.capitalize(), range=[min(y_os)-min(y_os)/10, max(y_os)+min(y_os)/10]),  # Установка параметра range для оси y
        xaxis_tickangle=-45,
        showlegend=True,
        legend=dict(x=1, y=1)
    )

    fig.write_html(f"plotly_figure1.html")








def get_dates(path):
    with open(path) as file:
        data = csv.reader(file)
        for row in data:
            begin, end = row
            return (begin, end)



def check():
    while True:
        f_path = os.path.join(os.getcwd(), 'dates')
        csv_files = [f.name for f in os.scandir(f_path) if f.name.endswith('.csv') and f.is_file() and f.name[0:6] == 'graph1']
        if len(csv_files) > 0:
            prev = csv_files[0]
            filepath = os.path.join(f_path, prev)
            dates = get_dates(filepath)

            os.remove(filepath)
            return_graph(dates[0], dates[1])


if __name__ == "__main__":
    check()