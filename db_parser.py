import psycopg2
from datetime import datetime, timedelta, date
from config import config
import json


parameters = config()
conn = psycopg2.connect(**parameters)
cur  = conn.cursor()


def fill_missing_days(data, start):
    filled_data = []
    current_date = data[0][-2]
    # timedelta = start-current
    start_date = datetime.strptime(start, "%Y-%m-%d").date()
    temp_start = start_date
    if current_date > start_date:
        days = (current_date - start_date).days
        for i in range(days):
            filled_data.append((data[0][0], 0, 0, 0, temp_start, 0))
            temp_start += timedelta(days=1)

    for i in range(len(data) - 1):
        current_date = data[i][-2]
        next_date = data[i + 1][-2]
        delta = next_date - current_date

        filled_data.append(data[i])

        # Fill in missing days if the time delta is more than 2 days
        if delta.days > 1:
            for j in range(1, delta.days):
                interpolated_date = current_date + timedelta(days=j)
                # Use the values from the previous day
                filled_data.append((data[i][0], data[i][1], data[i][2], 0, data[i][4], interpolated_date, data[i][6]))

    # Add the last record from the original data
    filled_data.append(data[-1])

    return filled_data




def sell_graph(data):
    result = []
    for i in data:
        result.append(i[3])
    return result


def left_amount_graph(data):
    result = []
    for i in data:
        result.append(i[1])
    return result


def price_graph(data):
    result = []
    for i in data:
        result.append(i[2])
    return result


def number_graph(data):
    left = left_amount_graph(data)
    sell = sell_graph(data)
    
    result = []
    for i in range(len(left)):
        result.append(int(left[i]) + int(sell[i]))
    return result


def income_graph(data):
    sell = sell_graph(data)
    price = price_graph(data)
    
    result = []
    for i in range(len(sell)):
        result.append(int(price[i]) * int(sell[i]))
    return result


def demand_graph(data):
    sell = sell_graph(data)
    
    result = []
    for i in range(len(sell)):
        result.append(int(sell[i]) / (int(data[i][6]) + 1))
    return result







graph_types = {
    "sell" : sell_graph,
    "left_amount" : left_amount_graph,
    "income" : income_graph,
    "price" : price_graph,
    "number" : number_graph,
    "demand" : demand_graph,
}


def get_by_date(start:date, end:date, product:str, graph_type:str):
    cur.execute(f"SELECT id FROM Products WHERE name = '{product}'")
    id = cur.fetchone()[0]
    cur.execute(f"SELECT * FROM History WHERE id = {id} AND change_date BETWEEN '{start}' AND '{end}' ORDER BY change_date ASC")
    
    results = cur.fetchall()
    results = fill_missing_days(results, start)
    # for res in results:
    #     print(res)

    return graph_types[graph_type](results)


def get_products():
    cur.execute("SELECT name FROM Products")
    res = cur.fetchall()

    result = []
    for i in res:
        result.append(i[0])
    return result



# blame Olzhas
############################################################

def get_bestseller():
    cur.execute("SELECT name FROM Products")
    res = cur.fetchall()
    product_names = get_products()
    current_date = datetime.today() - timedelta(days=31)
    current_date = current_date.date()


    sells_of_product = []
    for product in product_names:
        sum = 0
        cur.execute(f"SELECT sell FROM History WHERE id = (SELECT id FROM Products WHERE name = '{product}' AND change_date >= '{current_date}')")
        sells = cur.fetchall()
        for sell in sells:
            sum += sell[0]
        sells_of_product.append([sum, product])
    sells_of_product.sort(reverse=True)
    #print(sells_of_product)
    length = 1
    result = [product[1] for product in sells_of_product[:length]]
    return result

def get_leastseller():
    cur.execute("SELECT name FROM Products")
    res = cur.fetchall()
    product_names = get_products()
    current_date = datetime.today() - timedelta(days=31)
    current_date = current_date.date()


    sells_of_product = []
    for product in product_names:
        sum = 0
        cur.execute(f"SELECT sell FROM History WHERE id = (SELECT id FROM Products WHERE name = '{product}' AND change_date >= '{current_date}')")
        sells = cur.fetchall()
        for sell in sells:
            sum += sell[0]
        sells_of_product.append([sum, product])
    sells_of_product.sort()

    length = 1
    result = [product[1] for product in sells_of_product[:length]]
    return result

def get_mostviewed():
    cur.execute("SELECT name FROM Products")
    res = cur.fetchall()
    product_names = get_products()
    current_date = datetime.today() - timedelta(days=31)
    current_date = current_date.date()


    views_of_product = []
    for product in product_names:
        view_sum = 0
        cur.execute(f"SELECT views FROM History WHERE id = (SELECT id FROM Products WHERE name = '{product}' AND change_date >= '{current_date}')")
        views = cur.fetchall()
        for view in views:
            view_sum += view[0]
        views_of_product.append([view_sum, product])
    views_of_product.sort(reverse=True)

    #print(views_of_product)
    length = 1
    result = [product[1] for product in views_of_product[:length]]
    return result

def save_to_json(data, filename):
    with open(filename, 'w') as json_file:
        json.dump(data, json_file)

bestsellers = get_bestseller()
leastsellers = get_leastseller()
mostviewed = get_mostviewed()

# Save the results to JSON files
save_to_json(bestsellers, 'bestsellers.json')
save_to_json(leastsellers, 'leastsellers.json')
save_to_json(mostviewed, 'mostviewed.json')


#######################################################################################################################################################
# end blame Olzhas





if __name__ == "__main__":
    # data = get('2023-09-26', '2023-11-06', 'Iphone 14 Case', "demand")
    data = get_products()
    for i in data:
        print(i)


