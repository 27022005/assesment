# 1. Clinic Appointment System

class ClinicAppointment:
    def __init__(self):
        self.time_slots = ["10am", "11am", "12pm", "2pm", "3pm"]
        self.appointments = []

    def book_appointment(self):
        name = input("Enter patient name: ")
        age = int(input("Enter age: "))
        mobile = input("Enter mobile number: ")
        doctor = input("Enter preferred doctor: ")

        print("Available Time Slots:", self.time_slots)
        slot = input("Choose time slot: ")

        if slot not in self.time_slots:
            print("Invalid slot!")
            return

        count = sum(1 for ap in self.appointments
                    if ap["doctor"] == doctor and ap["slot"] == slot)

        if count >= 3:
            print("Slot full for this doctor!")
            return

        self.appointments.append({
            "name": name,
            "age": age,
            "mobile": mobile,
            "doctor": doctor,
            "slot": slot
        })

        print("Appointment Booked Successfully!")

    def view_or_cancel(self):
        mobile = input("Enter mobile number: ")

        for ap in self.appointments:
            if ap["mobile"] == mobile:
                print("Appointment Found:", ap)

                choice = input("Cancel appointment? (yes/no): ")
                if choice.lower() == "yes":
                    self.appointments.remove(ap)
                    print("Appointment Cancelled")
                return

        print("No appointment found!")

    def menu(self):
        while True:
            print("\n1. Book Appointment")
            print("2. View/Cancel Appointment")
            print("3. Exit")

            choice = input("Enter choice: ")

            if choice == "1":
                self.book_appointment()
            elif choice == "2":
                self.view_or_cancel()
            elif choice == "3":
                break
            else:
                print("Invalid Choice!")


#  2. School Management System

clinic = ClinicAppointment()
clinic.menu()


class SchoolManagement:
    def __init__(self):
        self.students = {}
        self.student_id = 1000

    def new_admission(self):
        name = input("Enter student name: ")
        age = int(input("Enter age: "))
        std_class = int(input("Enter class (1-12): "))
        mobile = input("Enter guardian mobile: ")

        if age < 5 or age > 18:
            print("Invalid Age!")
            return

        if len(mobile) != 10:
            print("Invalid Mobile Number!")
            return

        self.student_id += 1

        self.students[self.student_id] = {
            "name": name,
            "age": age,
            "class": std_class,
            "mobile": mobile
        }

        print("Admission Successful!")
        print("Student ID:", self.student_id)

    def view_student(self):
        sid = int(input("Enter Student ID: "))
        print(self.students.get(sid, "Student Not Found"))

    def update_student(self):
        sid = int(input("Enter Student ID: "))

        if sid in self.students:
            print("1. Update Class")
            print("2. Update Mobile")
            ch = input("Enter choice: ")

            if ch == "1":
                self.students[sid]["class"] = int(input("New Class: "))
            elif ch == "2":
                self.students[sid]["mobile"] = input("New Mobile: ")

            print("Record Updated")
        else:
            print("Student Not Found")

    def remove_student(self):
        sid = int(input("Enter Student ID: "))

        if sid in self.students:
            del self.students[sid]
            print("Student Removed")
        else:
            print("Student Not Found")

    def menu(self):
        while True:
            print("\n1. New Admission")
            print("2. View Student")
            print("3. Update Student")
            print("4. Remove Student")
            print("5. Exit")

            choice = input("Enter choice: ")

            if choice == "1":
                self.new_admission()
            elif choice == "2":
                self.view_student()
            elif choice == "3":
                self.update_student()
            elif choice == "4":
                self.remove_student()
            elif choice == "5":
                break
            else:
                print("Invalid Choice!")


sms = SchoolManagement()
sms.menu()


# 3. Bus Reservation System

class BusReservation:
    def __init__(self):
        self.routes = {
            "Mumbai to Pune": 500,
            "Delhi to Jaipur": 600,
            "Bangalore to Mysore": 400
        }
        self.tickets = {}
        self.seats = {}
        self.ticket_id = 2000

    def show_routes(self):
        print("\nAvailable Routes:")
        for route, price in self.routes.items():
            print(route, "- ₹", price)

    def book_ticket(self):
        name = input("Enter Name: ")
        age = int(input("Enter Age: "))
        mobile = input("Enter Mobile: ")

        self.show_routes()
        route = input("Select Route: ")

        if route not in self.routes:
            print("Invalid Route")
            return

        if self.seats.get(route, 0) >= 40:
            print("Bus Full!")
            return

        self.seats[route] = self.seats.get(route, 0) + 1
        self.ticket_id += 1

        self.tickets[self.ticket_id] = {
            "name": name,
            "age": age,
            "mobile": mobile,
            "route": route,
            "seat": self.seats[route],
            "price": self.routes[route]
        }

        print("Ticket Booked Successfully!")
        print("Ticket ID:", self.ticket_id)

    def view_ticket(self):
        tid = int(input("Enter Ticket ID: "))
        print(self.tickets.get(tid, "Ticket Not Found"))

    def cancel_ticket(self):
        tid = int(input("Enter Ticket ID: "))

        if tid in self.tickets:
            route = self.tickets[tid]["route"]
            self.seats[route] -= 1
            del self.tickets[tid]
            print("Ticket Cancelled")
        else:
            print("Ticket Not Found")

    def menu(self):
        while True:
            print("\n1. Show Routes")
            print("2. Book Ticket")
            print("3. View Ticket")
            print("4. Cancel Ticket")
            print("5. Exit")

            ch = input("Enter choice: ")

            if ch == "1":
                self.show_routes()
            elif ch == "2":
                self.book_ticket()
            elif ch == "3":
                self.view_ticket()
            elif ch == "4":
                self.cancel_ticket()
            elif ch == "5":
                break
            else:
                print("Invalid Choice!")


bus = BusReservation()
bus.menu()
