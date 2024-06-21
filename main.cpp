#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QIcon>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QIcon icon;
    icon.addFile(":/moon/moon/app.jpeg", QSize(), QIcon::Normal, QIcon::Off);
    app.setWindowIcon(icon);
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/appweatherWidgetProject/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
