obj Calculator {
    has result: int = 0;

    def add {
        number = int(input("Pick a number to add! "));
        self.result = self.result + number;
    }

    def subtract {
        number = int(input("Pick another number to subtract! "));
        self.result = self.result - number;
    }

    def get_result {
        return self.result;
    }
}

with entry {
    c = Calculator();
    c.add();
    c.add();
    c.subtract();
    print(c.get_result());
}
