# billing.py - Simple Billing System

def calculate_bill():
    print("===== Billing System =====")
    
    total = 0
    items = []

    while True:
        name = input("Enter item name (or 'done' to finish): ")
        if name.lower() == 'done':
            break
        
        try:
            price = float(input("Enter price: "))
            quantity = int(input("Enter quantity: "))
        except ValueError:
            print("Invalid input! Try again.")
            continue
        
        item_total = price * quantity
        total += item_total
        
        items.append((name, price, quantity, item_total))

    print("\n===== Bill Summary =====")
    for item in items:
        print(f"{item[0]} - {item[1]} x {item[2]} = {item[3]}")

    tax = total * 0.05  # 5% tax
    grand_total = total + tax

    print("-------------------------")
    print(f"Subtotal: {total}")
    print(f"Tax (5%): {tax}")
    print(f"Total: {grand_total}")
    print("=========================")


if __name__ == "__main__":
    calculate_bill()
