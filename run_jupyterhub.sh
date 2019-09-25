#!/bin/bash
python3 /srv/oauthenticator/addusers.py /srv/oauthenticator/userlist

# set up the formgrader
#setup_nbgrader grader-course101 course101_nbgrader_config.py
cp /srv/jupyterhub_config/grader_nbgrader_config.py ~grader-gel160/.jupyter/nbgrader_config.py
chown grader-gel160:grader-gel160 ~grader-gel160/.jupyter/nbgrader_config.py
#create_course grader-course101 course101

# Enable extensions for grading account.
sudo -u grader-gel160 jupyter nbextension enable --user create_assignment/main
sudo -u grader-gel160 jupyter nbextension enable --user formgrader/main --section=tree
sudo -u grader-gel160 jupyter serverextension enable --user nbgrader.server_extensions.formgrader


jupyterhub -f /srv/jupyterhub_config/jupyterhub_config.py --debug
