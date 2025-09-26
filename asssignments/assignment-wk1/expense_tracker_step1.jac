"""An Expense Tracker Program"""

with entry {
    expenses = [];
    while True {
        item = input("What did you buy? ('quit' when done): ");
        if item == 'quit' {
            break;
        }
        cost = float(input(f"How much did {item} cost? "));
        expenses.append((item, cost));
    }

    total = 0;
    for expense in expenses {
        total += expense[1];
    }
    print("You spent ${:.2f} today".format(total));
}