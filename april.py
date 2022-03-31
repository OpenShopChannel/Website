def determine_price(app):
    price = 15
    # for every character in app name add a dollar
    for char in app["display_name"]:
        price += 1

    # add the zip size divided by 2
    price += (app["zip_size"] / 2)

    # divide the current price by 2
    price = price / 2

    return price
