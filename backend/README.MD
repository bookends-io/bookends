navigate to your desired directory

# Create a new Python Virtual Environment
python3 -m venv fastapi-env

# Activate the Python virtual Environment
source fastapi-env/bin/activate

# Install the requirements
pip3 install -r requirements.txt

# CD into the app
cd app

# Run from the app directory 
uvicorn main:app --reload 

# Profit