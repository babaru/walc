#include <QtGui/QApplication>
#include <QDeclarativeContext>
#include "qmlapplicationviewer.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QmlApplicationViewer viewer;
    viewer.rootContext()->setContextProperty("mainwindow", &viewer);
    viewer.setWindowFlags(Qt::FramelessWindowHint);
    viewer.setAttribute(Qt::WA_TranslucentBackground);
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/walc/main.qml"));
    viewer.showExpanded();
    viewer.acceptDrops();

    return app.exec();
}
