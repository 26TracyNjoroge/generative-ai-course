walker ExpenseCollector {
    has expenses: list;

    can collect_expenses with `root entry;
    def init;
    def add_expense(item: str, cost: float);
    def calculate_total -> float;
    def display_summary;
}

node expense_entry {
    can prompt_for_expense with ExpenseCollector entry;
}

with entry {
    ExpenseCollector() spawn root;
}


impl ExpenseCollector.init {
    self.expenses = [];
}

impl ExpenseCollector.collect_expenses {
    end = here;

    for i = 0 to i < 100 by i += 1 {
        end ++> (end := expense_entry());
    }

    visit [-->];
}

impl expense_entry.prompt_for_expense {
    item = input("What did you buy? ('q' when done): ");

    if item == "q" {
        visitor.display_summary();
        disengage;
    }
    
    cost = float(input(f"How much did {item} cost? "));
    visitor.add_expense(item, cost);
    
    visit [-->];
}

impl ExpenseCollector.add_expense(item: str, cost: float) {
    self.expenses.append((item, cost));
}

impl ExpenseCollector.calculate_total -> float {
    total = 0;
    for expense in self.expenses {
        total += expense[1];
    }
    return total;
}

impl ExpenseCollector.display_summary {
    total = self.calculate_total();
    print("You spent ${:.2f} today".format(total));
}