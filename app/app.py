import os
from dotenv import load_dotenv
load_dotenv()

from langchain_groq import ChatGroq
from langchain_community.utilities import SQLDatabase
from langchain_community.agent_toolkits import create_sql_agent
from sqlalchemy import create_engine
import gradio as gr


llm = ChatGroq(
    model="llama-3.3-70b-versatile",
    api_key=os.getenv("GROQ_API_KEY"),
    temperature=0
)

engine = create_engine(
    f"mysql+pymysql://root:{os.getenv('DB_PASSWORD')}@127.0.0.1/hotel_management"
)

db = SQLDatabase(engine)




agent = create_sql_agent(
    llm=llm,
    db=db,
    verbose=True,
    handle_parsing_errors=True,
    max_iterations=15,
    max_execution_time=60
)



def chat(message, history):
    response = agent.invoke(message)
    return response['output']



demo = gr.ChatInterface(
    fn=chat,
    title="🏨 Hotel Analytics Assistant",
    description="Ask me anything about hotel bookings, revenue, and guest patterns.",
)
demo.launch()