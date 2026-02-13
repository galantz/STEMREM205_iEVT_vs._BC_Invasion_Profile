##/bin/bash

cd /Users/georgelantz/Documents/GitHub/STEMREM-iEVT-vs.-CC-Comparison

# 1) Create env
python3 -m venv .venv

# 2) Activate it
source .venv/bin/activate   # mac/linux
# .venv\Scripts\activate    # windows

# 3) Install your packages
pip install -U pip
pip install jupyter ipykernel pandas numpy scipy scikit-learn matplotlib seaborn

# 4) Save exact versions
pip freeze > requirements.txt

python -m ipykernel install --user --name stemrem-env --display-name "Python (stemrem-env)"
