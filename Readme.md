# 🏨 Hotel Booking Analytics — AI Agent for Relational Database System

Final project for the Databases Course. Transforms a real-world hotel booking dataset into a normalized MySQL database and layers an AI-powered natural language query agent on top.

---

## Project Structure

```
SQL-Final-Project/
├── app/
│   └── app.py                  # Gradio chat UI for the AI agent
├── Code/
│   ├── Hotel_management.sql    # Database schema (CREATE TABLE statements)
│   ├── Views.sql               # 4 analytical views
│   ├── Stored procedures.sql   # 2 stored procedures
│   └── Calls.sql               # Example procedure calls
├── data/
│   └── hotel_bookings.csv      # Original dataset (119,390 rows)
├── diagrams/
│   └── ER-Diagram.md           # Entity-Relationship diagram
├── Jupy_books/
│   ├── data_redacting.ipynb    # Data cleaning + DB population notebook
│   └── ai_agent.ipynb          # AI agent setup and testing notebook
└── Notes/                      # Planning and design notes
```

---

## Requirements

- Python 3.11+
- MySQL 8.0+
- Node.js (optional, for diagram tools)

Install Python dependencies:

```bash
pip install pandas sqlalchemy pymysql langchain langchain-community langchain-groq gradio
```

---

## Setup

### 1. Database

- Open MySQL Workbench and run `Code/Hotel_management.sql` to create the database and all tables
- Then run `Code/Views.sql` to create the analytical views
- Then run `Code/Stored procedures.sql` to create the stored procedures

### 2. Data Cleaning and Population

Open `Jupy_books/data_redacting.ipynb` in VS Code or Jupyter and run all cells in order. This will:
- Clean the raw CSV dataset
- Populate all 8 database tables

Update the connection string in the notebook with your MySQL credentials:
```python
engine = create_engine("mysql+pymysql://root:YOUR_PASSWORD@127.0.0.1/hotel_management")
```

### 3. AI Agent Notebook

Open `Jupy_books/ai_agent.ipynb` and add your Groq API key (get one free at console.groq.com). Run all cells to test the agent.

### 4. Chat UI

Run the Gradio chat app:
```bash
python app/app.py
```

Then open `http://127.0.0.1:7860` in your browser. You can ask questions like:
- *"Which month had the most bookings?"*
- *"What is the average daily rate for transient guests?"*
- *"Which company made the most bookings?"*

---

## Database Schema

8 tables in a star schema centered on the `Bookings` fact table:

| Table | Description |
|---|---|
| Hotels | Hotel types |
| Customers | Guest profiles |
| Agents | Booking agents |
| Companies | Corporate clients |
| MealPlans | Meal plan options |
| RoomTypes | Room type codes |
| DepositTypes | Deposit categories |
| Bookings | Central fact table (118,563 rows) |

---

## Problem Statements

1. **Seasonal Occupancy Analysis** — peak and low demand periods by month/year
2. **Guest Profitability Analysis** — which guest segments generate the most revenue
3. **Guest Loyalty Analysis** — what factors drive repeat bookings
4. **Corporate Partnership Opportunity** — top corporate clients by booking volume

---

## Tech Stack

- **Database**: MySQL 8.0
- **Data Processing**: Python, pandas
- **ORM / Connection**: SQLAlchemy, PyMySQL
- **AI Agent**: LangChain, LLaMA 3.3 70B (via Groq)
- **Chat UI**: Gradio
- **IDE**: VS Code
