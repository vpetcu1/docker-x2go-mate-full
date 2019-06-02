eclipse_desktop="[Desktop Entry]
Encoding=UTF-8
Name=Eclipse
Comment=Eclipse IDE
Exec=eclipse
Icon=/opt/eclipse/icon.xpm
Terminal=false
Type=Application
Categories=GNOME;Application;Development;
StartupNotify=true"

echo -e "$eclipse_desktop" | sudo tee /usr/share/applications/eclipse.desktop

eclipse_desktop="[Desktop Entry]
Encoding=UTF-8
Name=Eclipse
Comment=Eclipse IDE
Exec=eclipse -clean -data /home/$REMOTE_USER/work/$PROJECT_NAME
Icon=/opt/eclipse/icon.xpm
Terminal=false
Type=Application
Categories=GNOME;Application;Development;
StartupNotify=true"

echo -e "$eclipse_desktop" | sudo tee /home/$REMOTE_USER/Desktop/eclipse.desktop
chown $REMOTE_USER:$REMOTE_USER /home/$REMOTE_USER/Desktop/eclipse.desktop
chmod +x /home/$REMOTE_USER/Desktop/eclipse.desktop

#cp /usr/share/applications/eclipse.desktop /home/$REMOTE_USER/Desktop/
#sed -i -e "s/Exec=eclipse/Exec=eclipse -clean -data /home/$REMOTE_USER/work/$PROJECT_NAME/g" home/$REMOTE_USER/Desktop/eclipse.desktop
#sed -i -e "s/Icon=/opt/eclipse/icon.xpm/Icon=eclipse/g" home/$REMOTE_USER/Desktop/eclipse.desktop

cp /eclipse_preferences.epf /home/$REMOTE_USER/work/$PROJECT_NAME/
sed -i -e "s/REMOTE_USER/$REMOTE_USER/g" /home/$REMOTE_USER/work/$PROJECT_NAME/eclipse_preferences.epf
sed -i -e "s/PROJECT_NAME/$PROJECT_NAME/g" /home/$REMOTE_USER/work/$PROJECT_NAME/eclipse_preferences.epf
