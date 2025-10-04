walker ExpenseCollector {
    has item: str = "";
    has cost: float = 0.0;

    can start with `root entry;
    can process_entry with expense_node entry;
}

node expense_node {
    has expenses: list = [];
}

with entry:__main__ {
    root spawn ExpenseCollector(item="", cost=0.0);
}

impl ExpenseCollector.start {
    if not [root --> (`?expense_node)] {
        next = root ++> expense_node();
    } else {
        next = [root --> (`?expense_node)];
    }
    visit next;
}

impl ExpenseCollector.process_entry {
    if self.item == "" {
    
        while True {
            item_input = input("What did you buy? ('q' when done): ");
            
            if item_input == "q" {
                break;
            }
            
            cost_input = float(input(f"How much did {item_input} cost? "));
            here.expenses.append((item_input, cost_input));
        }
        
        total = 0.0;
        for expense in here.expenses {
            total += expense[1];
        }
        print("You spent ${:.2f} today".format(total));
        disengage;
    }
}