################################################################################
## DISABLED 
################################################################################

## kube* #######################################################################

## proxmark3 ###################################################################

PKG_CONFIG_PATH="/usr/local/Cellar/qt@5/5.15.7/lib/pkgconfig/"

export QT_PKG_CONFIG_QT5CORE=$(find /usr -name Qt5Core.pc 2>/dev/null)
chmod 666 $QT_PKG_CONFIG_QT5CORE
echo "moc_location=\${prefix}/bin/moc" >> $QT_PKG_CONFIG_QT5CORE
chmod 444 $QT_PKG_CONFIG_QT5CORE

## proxmark3 ###################################################################

# literal saves time compared to above, but is obviously less robust to package location changes
export QT_PKG_CONFIG_QT5CORE="/usr/local/Cellar/qt@5/5.15.8_1/lib/pkgconfig/Qt5Core.pc"  
# export QT_PKG_CONFIG_QT5CORE=$(find /usr -name Qt5Core.pc 2>/dev/null)
chmod 666 $QT_PKG_CONFIG_QT5CORE
echo "moc_location=\${prefix}/bin/moc" >> $QT_PKG_CONFIG_QT5CORE
chmod 444 $QT_PKG_CONFIG_QT5CORE

