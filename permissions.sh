echo "Change owner to folder work to $REMOTE_USER"
chown $REMOTE_USER:$REMOTE_USER -R /home/$REMOTE_USER/work
chown $REMOTE_USER:$REMOTE_USER -R /home/$REMOTE_USER/Desktop/eclipse.desktop

echo "Add user $USER to docker group"
usermod -aG docker $REMOTE_USER

