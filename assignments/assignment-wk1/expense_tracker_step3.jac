obj ExpenseTracker {
    has expenses: list = [];

    def add_expense(item: str, cost: float);
    def calculate_total -> float;
    def run;
}

impl ExpenseTracker.add_expense(item: str, cost: float) {
    self.expenses.append((item, cost));
}

impl ExpenseTracker.calculate_total -> float {
    total = 0;
    for expense in self.expenses {
            total += expense[1];
        }
        return total;
}

impl ExpenseTracker.run {
    while True {
        item = input("What did you buy? ('q' when done): ");

        if item == "q" {
            break;
        }

        cost = float(input(f"How much did {item} cost? "));
        self.add_expense(item, cost);
    }
    total = self.calculate_total();
    print("You spent ${:.2f} today".format(total));
}


with entry {
    tracker = ExpenseTracker();
    tracker.run();
}

