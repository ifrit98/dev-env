
# Init reqs
sudo apt update
sudo apt install python3-dev python3-pip  # Python 3
sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

# Install anaconda
wget "https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh"
bash "./Anaconda3-2021.11-Linux-x86_64.sh"

# Install poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -

# Install pipx
python3 -m pip install --user pipx
python3 -m pipx ensurepath

# Create the conda env
conda env create -f ./conda_env.yaml

# Copy startup file to to /home/<username>/pystart.py
cp ./pystart.py ~/pystart.py
echo 'export PYTHONSTARTUP="~/pystart.py"' >> ~/.bashrc
