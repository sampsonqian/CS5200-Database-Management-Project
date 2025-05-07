import pymysql
from tkinter import Tk, Toplevel, Label, Entry, Button, messagebox, OptionMenu, Radiobutton, StringVar
from tabulate import tabulate


# Database connection
def connect_to_db():
    try:
        connection = pymysql.connect(
            host="localhost",
            user="root",  # Update with your MySQL username
            password="password",  # Update with your MySQL password
            db="Flight_Tracker",
            charset="utf8mb4",
            cursorclass=pymysql.cursors.DictCursor,
        )
        return connection
    except pymysql.err.OperationalError as e:
        messagebox.showerror("Error", f"Error connecting to database: {e}")
        return None


# Administrator Menu
def admin_menu(cursor):
    def admin_login():
        def login():
            username = admin_username_entry.get().strip()
            password = admin_password_entry.get().strip()
            try:
                cursor.execute(
                    f"SELECT IsExistingAdministrator('{username}', '{password}') AS isValid;"
                )
                result = cursor.fetchone()
                if result and result["isValid"]:
                    messagebox.showinfo("Success", "Login successful!")
                    admin_login_window.destroy()
                    admin_menu_options(cursor)
                else:
                    messagebox.showerror("Error", "Invalid administrator credentials.")
            except pymysql.Error as e:
                messagebox.showerror("Error", f"Error during login: {e}")

        admin_login_window = Toplevel(root)
        admin_login_window.title("Administrator Login")
        admin_login_window.geometry("300x200")

        Label(admin_login_window, text="Administrator Login").pack(pady=10)
        Label(admin_login_window, text="Username").pack()
        admin_username_entry = Entry(admin_login_window)
        admin_username_entry.pack(pady=5)
        Label(admin_login_window, text="Password").pack()
        admin_password_entry = Entry(admin_login_window, show="*")
        admin_password_entry.pack(pady=5)
        Button(admin_login_window, text="Login", command=login).pack(pady=10)

    def admin_menu_options(cursor):
        def show_add_administrator():
            clear_window(admin_menu_window)
            Label(admin_menu_window, text="Add Administrator").pack(pady=10)
            Label(admin_menu_window, text="Username").pack()
            admin_username_entry = Entry(admin_menu_window)
            admin_username_entry.pack(pady=5)
            Label(admin_menu_window, text="Password").pack()
            admin_password_entry = Entry(admin_menu_window, show="*")
            admin_password_entry.pack(pady=5)
            Button(admin_menu_window, text="Add Administrator",
                   command=lambda: add_administrator(admin_username_entry.get(), admin_password_entry.get())).pack(pady=10)

        def show_add_flight():
            clear_window(admin_menu_window)
            Label(admin_menu_window, text="Add Flight").pack(pady=10)
            Label(admin_menu_window, text="Airline IATA Code").pack()
            airline_entry = Entry(admin_menu_window)
            airline_entry.pack(pady=5)
            Label(admin_menu_window, text="Airplane Model ID").pack()
            model_id_entry = Entry(admin_menu_window)
            model_id_entry.pack(pady=5)
            Label(admin_menu_window, text="Route ID").pack()
            route_id_entry = Entry(admin_menu_window)
            route_id_entry.pack(pady=5)
            Label(admin_menu_window, text="Scheduled Departure").pack()
            dep_time_entry = Entry(admin_menu_window)
            dep_time_entry.pack(pady=5)
            Label(admin_menu_window, text="Scheduled Arrival").pack()
            arr_time_entry = Entry(admin_menu_window)
            arr_time_entry.pack(pady=5)
            Label(admin_menu_window, text="Status").pack()
            status_entry = Entry(admin_menu_window)
            status_entry.pack(pady=5)
            Label(admin_menu_window, text="Departure Terminal ID").pack()
            dep_terminal_entry = Entry(admin_menu_window)
            dep_terminal_entry.pack(pady=5)
            Label(admin_menu_window, text="Arrival Terminal ID").pack()
            arr_terminal_entry = Entry(admin_menu_window)
            arr_terminal_entry.pack(pady=5)
            Label(admin_menu_window, text="Baggage Claim ID").pack()
            baggage_claim_entry = Entry(admin_menu_window)
            baggage_claim_entry.pack(pady=5)
            Button(admin_menu_window, text="Add Flight",
                   command=lambda: add_flight(airline_entry.get(), model_id_entry.get(), route_id_entry.get(),
                                              dep_time_entry.get(), arr_time_entry.get(), status_entry.get(),
                                              dep_terminal_entry.get(), arr_terminal_entry.get(), baggage_claim_entry.get())).pack(pady=10)

        def show_update_flight_status():
            clear_window(admin_menu_window)
            Label(admin_menu_window, text="Update Flight Status").pack(pady=10)
            Label(admin_menu_window, text="Flight ID").pack()
            flight_id_entry = Entry(admin_menu_window)
            flight_id_entry.pack(pady=5)
            Label(admin_menu_window, text="New Status").pack()
            status_entry = Entry(admin_menu_window)
            status_entry.pack(pady=5)
            Button(admin_menu_window, text="Update Status",
                   command=lambda: update_flight_status(flight_id_entry.get(), status_entry.get())).pack(pady=10)

        def show_add_booking():
            clear_window(admin_menu_window)
            Label(admin_menu_window, text="Add Booking").pack(pady=10)
            Label(admin_menu_window, text="Passenger ID").pack()
            passenger_id_entry = Entry(admin_menu_window)
            passenger_id_entry.pack(pady=5)
            Label(admin_menu_window, text="Flight ID").pack()
            flight_id_entry = Entry(admin_menu_window)
            flight_id_entry.pack(pady=5)
            Label(admin_menu_window, text="Booking Confirmation Number").pack()
            confirmation_number_entry = Entry(admin_menu_window)
            confirmation_number_entry.pack(pady=5)
            Label(admin_menu_window, text="Ticket Class").pack()
            ticket_class_entry = Entry(admin_menu_window)
            ticket_class_entry.pack(pady=5)
            Button(admin_menu_window, text="Add Booking",
                   command=lambda: add_booking(passenger_id_entry.get(), flight_id_entry.get(),
                                               confirmation_number_entry.get(), ticket_class_entry.get())).pack(pady=10)

        def add_administrator(username, password):
            try:
                cursor.execute(f"CALL AddAdministrator('{username}', '{password}');")
                cnx.commit()
                messagebox.showinfo("Success", "Administrator added successfully.")
            except pymysql.Error as e:
                messagebox.showerror("Error", f"Error adding administrator: {e}")

        def add_flight(airline, model_id, route_id, dep_time, arr_time, status, dep_terminal, arr_terminal, baggage_claim):
            try:
                cursor.execute(
                    f"CALL AddFlight('{airline}', {model_id}, {route_id}, '{dep_time}', '{arr_time}', '{status}', {dep_terminal}, {arr_terminal}, {baggage_claim});")
                cnx.commit()
                messagebox.showinfo("Success", "Flight added successfully.")
            except pymysql.Error as e:
                messagebox.showerror("Error", f"Error adding flight: {e}")

        def update_flight_status(flight_id, status):
            try:
                cursor.execute(f"CALL UpdateFlightStatus({flight_id}, '{status}');")
                cnx.commit()
                messagebox.showinfo("Success", "Flight status updated successfully.")
            except pymysql.Error as e:
                messagebox.showerror("Error", f"Error updating flight status: {e}")

        def add_booking(passenger_id, flight_id, confirmation_number, ticket_class):
            try:
                cursor.execute(
                    f"CALL AddBooking({passenger_id}, {flight_id}, '{confirmation_number}', '{ticket_class}');")
                cnx.commit()
                messagebox.showinfo("Success", "Booking added successfully.")
            except pymysql.Error as e:
                messagebox.showerror("Error", f"Error adding booking: {e}")
                
        def delete_booking():
            clear_window(admin_menu_window)  # Pass the admin_menu_window as the window argument
            Label(admin_menu_window, text="Delete Booking").pack(pady=10)
            Label(admin_menu_window, text="Booking Confirmation Number").pack()
            booking_confirmation_entry = Entry(admin_menu_window)
            booking_confirmation_entry.pack(pady=5)

            def delete_booking_action():
                confirmation_number = booking_confirmation_entry.get().strip()
                try:
                    cursor.execute(f"CALL DeleteBooking('{confirmation_number}');")
                    cursor.connection.commit()
                    messagebox.showinfo("Success", "Booking deleted successfully.")
                except pymysql.Error as e:
                    messagebox.showerror("Error", f"Error deleting booking: {e}")

            Button(admin_menu_window, text="Delete Booking", command=delete_booking_action).pack(pady=10)


        def clear_window(window):
            for widget in window.winfo_children():
                widget.destroy()

        admin_menu_window = Toplevel(root)
        admin_menu_window.title("Administrator Menu")
        admin_menu_window.geometry("500x400")

        Label(admin_menu_window, text="Administrator Menu").pack(pady=10)
        Button(admin_menu_window, text="Add a New Flight", command=show_add_flight).pack(pady=10)
        Button(admin_menu_window, text="Update Flight Status", command=show_update_flight_status).pack(pady=10)
        Button(admin_menu_window, text="Add a New Booking", command=show_add_booking).pack(pady=10)
        Button(admin_menu_window, text="Delete Booking", command=delete_booking).pack(pady=10)
        Button(admin_menu_window, text="Add a New Administrator", command=show_add_administrator).pack(pady=10)

    admin_login()


# Passenger Menu
def passenger_menu(cursor):
    def fetch_bookings_and_flight_info():
        first_name = passenger_first_name_entry.get().strip()
        last_name = passenger_last_name_entry.get().strip()
        if not first_name or not last_name:
            messagebox.showwarning("Input Error", "Please provide both first and last name.")
            return

        try:
            # Retrieve booking confirmation numbers
            cursor.execute(f"CALL GetPassengerBookings('{first_name}', '{last_name}');")
            bookings = cursor.fetchall()
            if not bookings:
                messagebox.showinfo("Info", "No bookings found for this passenger.")
                return

            # Display retrieved bookings
            messagebox.showinfo("Bookings", tabulate(bookings, headers="keys", tablefmt="pretty"))

            # Fetch flight information for each booking confirmation number
            for booking in bookings:
                confirmation_number = booking['BookingConfirmationNumber']
                cursor.execute(f"CALL GetFlightInfoByConfirmation('{confirmation_number}');")
                flight_info = cursor.fetchall()
                if flight_info:
                    messagebox.showinfo(
                        f"Flight Info for {confirmation_number}",
                        tabulate(flight_info, headers="keys", tablefmt="pretty")
                    )
                else:
                    messagebox.showinfo(f"Info", f"No flight information found for booking {confirmation_number}.")
        except pymysql.Error as e:
            messagebox.showerror("Error", f"Error fetching data: {e}")

    def fetch_flight_info_by_confirmation():
        confirmation_number = booking_confirmation_entry.get().strip()
        if not confirmation_number:
            messagebox.showwarning("Input Error", "Please provide a booking confirmation number.")
            return

        try:
            cursor.execute(f"CALL GetFlightInfoByConfirmation('{confirmation_number}');")
            flight_info = cursor.fetchall()
            if flight_info:
                messagebox.showinfo("Flight Info", tabulate(flight_info, headers="keys", tablefmt="pretty"))
            else:
                messagebox.showinfo("Info", "No flight information found for this booking.")
        except pymysql.Error as e:
            messagebox.showerror("Error", f"Error fetching flight info: {e}")

    # Create Passenger Menu Window
    passenger_menu_window = Toplevel(root)
    passenger_menu_window.title("Passenger Menu")
    passenger_menu_window.geometry("500x600")

    Label(passenger_menu_window, text="Passenger Menu").pack(pady=10)

    # Fetch bookings and flight info by name
    Label(passenger_menu_window, text="Fetch Bookings and Flight Info by Name").pack(pady=5)
    Label(passenger_menu_window, text="First Name").pack()
    passenger_first_name_entry = Entry(passenger_menu_window)
    passenger_first_name_entry.pack(pady=5)
    Label(passenger_menu_window, text="Last Name").pack()
    passenger_last_name_entry = Entry(passenger_menu_window)
    passenger_last_name_entry.pack(pady=5)
    Button(passenger_menu_window, text="Fetch Bookings and Flight Info", command=fetch_bookings_and_flight_info).pack(pady=10)

    # Fetch flight info by confirmation number
    Label(passenger_menu_window, text="Fetch Flight Info by Confirmation Number").pack(pady=15)
    Label(passenger_menu_window, text="Booking Confirmation Number").pack()
    booking_confirmation_entry = Entry(passenger_menu_window)
    booking_confirmation_entry.pack(pady=5)
    Button(passenger_menu_window, text="Fetch Flight Info", command=fetch_flight_info_by_confirmation).pack(pady=10)



# Viewer menu
def viewer_menu(cursor):
    def fetch_departures():
        date = selected_date.get()
        airport = selected_airport.get()
        try:
            cursor.execute(f"CALL GetDepartingFlights('{date}', '{airport}');")
            departures = cursor.fetchall()
            if departures:
                messagebox.showinfo("Departures", tabulate(departures, headers="keys", tablefmt="pretty"))
            else:
                messagebox.showinfo("Info", "No departures found.")
        except pymysql.Error as e:
            messagebox.showerror("Error", f"Error fetching departures: {e}")

    def fetch_arrivals():
        date = selected_date.get()
        airport = selected_airport.get()
        try:
            cursor.execute(f"CALL GetArrivingFlights('{date}', '{airport}');")
            arrivals = cursor.fetchall()
            if arrivals:
                messagebox.showinfo("Arrivals", tabulate(arrivals, headers="keys", tablefmt="pretty"))
            else:
                messagebox.showinfo("Info", "No arrivals found.")
        except pymysql.Error as e:
            messagebox.showerror("Error", f"Error fetching arrivals: {e}")

    def load_options():
        try:
            # Fetch available dates
            cursor.execute("CALL GetFlightDates();")
            dates = cursor.fetchall()
            date_options = [str(date["FlightDate"]) for date in dates]

            # Fetch available airports
            cursor.execute("CALL GetAirportIATACodes();")
            airports = cursor.fetchall()
            airport_options = [airport["IATA_Code"] for airport in airports]

            return date_options, airport_options
        except pymysql.Error as e:
            messagebox.showerror("Error", f"Error loading options: {e}")
            return [], []

    # Load available dates and airports
    available_dates, available_airports = load_options()

    if not available_dates or not available_airports:
        return  # Exit the menu if no options are available

    # Initialize dropdown selection variables
    selected_date = StringVar()
    selected_date.set(available_dates[0])  # Default to the first date
    selected_airport = StringVar()
    selected_airport.set(available_airports[0])  # Default to the first airport

    # Create viewer menu window
    viewer_menu_window = Toplevel(root)
    viewer_menu_window.title("Viewer Menu")
    viewer_menu_window.geometry("500x500")

    Label(viewer_menu_window, text="Viewer Menu").pack(pady=10)

    # Date selection
    Label(viewer_menu_window, text="Date (YYYY-MM-DD)").pack(pady=5)
    date_dropdown = OptionMenu(viewer_menu_window, selected_date, *available_dates)
    date_dropdown.pack(pady=5)

    # Airport selection
    Label(viewer_menu_window, text="Airport IATA Code").pack(pady=5)
    airport_dropdown = OptionMenu(viewer_menu_window, selected_airport, *available_airports)
    airport_dropdown.pack(pady=5)

    # Fetch departures button
    Button(viewer_menu_window, text="Fetch Departures", command=fetch_departures).pack(pady=10)

    # Fetch arrivals button
    Button(viewer_menu_window, text="Fetch Arrivals", command=fetch_arrivals).pack(pady=10)



# Main GUI
root = Tk()
root.title("Flight Tracker")
root.geometry("400x300")

cnx = connect_to_db()
if cnx:
    cursor = cnx.cursor()

# Role Selection
role = StringVar(value="")

Label(root, text="Select Your Role").pack(pady=20)

Radiobutton(root, text="Administrator", variable=role, value="Administrator", command=lambda: admin_menu(cursor)).pack(
    pady=5
)
Radiobutton(root, text="Passenger", variable=role, value="Passenger", command=lambda: passenger_menu(cursor)).pack(pady=5)
Radiobutton(root, text="Viewer", variable=role, value="Viewer", command=lambda: viewer_menu(cursor)).pack(pady=5)

Button(root, text="Exit", command=root.quit).pack(pady=20)

root.mainloop()

if cnx:
    cnx.close()
