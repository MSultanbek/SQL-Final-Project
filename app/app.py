from langchain_groq import ChatGroq
from langchain_community.utilities import SQLDatabase
from langchain_community.agent_toolkits import create_sql_agent
from sqlalchemy import create_engine
import gradio as gr


llm = ChatGroq(
    model="llama-3.3-70b-versatile",
    api_key="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",
    temperature=0
)




engine = create_engine(
    "mysql+pymysql://root:g1k8tc@127.0.0.1/hotel_management"
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