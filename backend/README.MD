navigate to your desired directory

# Create a new Python Virtual Environment
python3 -m venv fastapi-env

# Activate the Python virtual Environment
source fastapi-env/bin/activate

# Run from the app directory 
uvicorn main:app --reload 

# Profit