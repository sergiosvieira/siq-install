#!/bin/bash
ssh-agent bash -c 'ssh-add ~/.ssh/id_ed25519; git clone git@github.com:sergiosvieira/siq.git'
cd siq
git checkout -b development
git pull origin development
cd siq_project
pip install -r requirements.txt
python manage.py makemigrations
python manage.py migrate
sed -i '49,711s/^/#/' main_app/seeders.py 
sed -i '734,1365s/^/#/' main_app/seeders.py 
python manage.py seed
sed -i '49,96s/^#//' main_app/seeders.py
python manage.py seed
sed -i '97,135s/^#//' main_app/seeders.py
python manage.py seed
sed -i '136,473s/^#//' main_app/seeders.py
python manage.py seed
sed -i '474,711s/^#//' main_app/seeders.py
python manage.py seed
sed -i '734,853s/^#//' main_app/seeders.py
python manage.py seed
sed -i '854,1365s/^#//' main_app/seeders.py
python manage.py seed
