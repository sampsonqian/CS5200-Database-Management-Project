# Project Setup and Execution Instructions

## Prerequisites

- **Operating System**: Windows, macOS
- **Python Version**: 3.6 or higher
- **MySQL Server Version**: 8.0 or higher
- **MySQL Workbench**

## Required Libraries and Software

### Python 3.x

Download and install Python from the official website:  
[https://www.python.org/downloads/](https://www.python.org/downloads/)

### MySQL Server and Workbench

Download and install MySQL Server from the official website:  
[https://dev.mysql.com/downloads/mysql/](https://dev.mysql.com/downloads/mysql/)

Download MySQL Workbench from the official website:  
[https://dev.mysql.com/downloads/workbench/](https://dev.mysql.com/downloads/workbench/) for GUI-based database management.

## Python Libraries

Install the required Python libraries using pip:

````bash
pip install pymysql
pip install tabulate
````

## Installation Directories

- **Python Script**: Place the Python script `appGUI.py` in a directory of your choice.
- **SQL Scripts**: Place the SQL scripts `flight_tracker.sql` and `addons.sql` in the same directory as the Python script for ease of access.

---

## Setup Instructions

### Set Up the Database
1. Open a terminal or command prompt.
2. Navigate to the directory containing the SQL scripts.
3. Connect to your MySQL server.
4. Once connected, execute the SQL scripts.

### Configure Database Connection in Python Script

1. Open `appGUI.py` in a text editor.
2. Ensure that the connection parameters on **line 11** and **line 12** match your MySQL server settings (e.g., username and password).

---

## Run the Python Application

1. In the terminal or command prompt, navigate to the directory containing `appGUI.py`.
2. Replace the default username and password on **line 11** and **line 12** with your MySQL server credentials.
3. Run the script:

```bash
python appGUI.py
```

## Login Credentials

### Administrator

You may log in using either of the following credentials:

- **Username**: `admin1`
  **Password**: `123456`

**OR**

- **Username**: `admin2`
  **Password**: `01234567`

### Passengers and Viewers

No login is required. You can proceed directly to the respective menus.

