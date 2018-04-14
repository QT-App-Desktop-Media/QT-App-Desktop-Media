#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtCore>
#include <QQmlContext>
#include <QFile>
#include <QDebug>
#include <QList>
#include "mythread.h"
#include "datamodel.h"
#include "language.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    Language myLanguage;
    DataModel *model = new DataModel();
    DataModel *model2 = new DataModel();
    DataModel *model3 = new DataModel();
    DataModel *model4 = new DataModel();
    int i = 0;
    QString directory = "C:\\Users\\phamthinga\\Pictures\\QT\\Game";
    QDir dir(directory);
    QFileInfoList list = dir.entryInfoList();
    QList<QString>a;
    QList<int> b;
    foreach (QFileInfo finfo, list) {

          QString name = finfo.fileName();
          if(i <2){
              i++;
          } else {
                a.append(name);
          }
    }
    for(int j = 0; j < a.size(); j++) { b.append(j); }
    MyThread myThread(a, b);
    myThread.start();
    i = 0;
    QDir d2("C:\\Users\\phamthinga\\Pictures\\QT\\Cook");
    QFileInfoList list2 = d2.entryInfoList();
    QList<QString>a2;
    foreach (QFileInfo finfo, list2) {
          if(i <2){
              i++;
          } else {
                a2.append(finfo.fileName());
          }
    }
    for(int k1 =0;k1<a2.size();k1++){
        Photo photo2;
        photo2.setName(a2.at(k1));
        model2->photolist.append(photo2);
    }
    QList<int> b2;
    for(int j = 0; j < a2.size(); j++) {
        b2.append(j);
    }
    MyThread myThread2(a2, b2);
    myThread2.start();
    i = 0;
    QDir d3("C:\\Users\\phamthinga\\Pictures\\QT\\Idol");
    QFileInfoList list3 = d3.entryInfoList();
    QList<QString>a3;
    foreach (QFileInfo finfo, list3) {
          if(i <2){
              i++;
          } else {
                a3.append(finfo.fileName());
          }
    }
    for(int k2 =0;k2<a3.size();k2++){
        Photo photo3;
        photo3.setName(a3.at(k2));
        model3->photolist.append(photo3);
    }
    QList<int> b3;
    for(int j = 0; j < a3.size(); j++) {
        b3.append(j);
    }
    MyThread myThread3(a3, b3);
    myThread3.start();
    i = 0;
    QDir d4("C:\\Users\\phamthinga\\Pictures\\QT\\Film");
    QFileInfoList list4 = d4.entryInfoList();
    QList<QString>a4;
    foreach (QFileInfo finfo, list4) {
          if(i <2){
              i++;
          } else {
                a4.append(finfo.fileName());
          }
    }
    for(int k3 =0;k3<a4.size();k3++){
        Photo photo4;
        photo4.setName(a4.at(k3));
        model4->photolist.append(photo4);
    }
    QList<int> b4;
    for(int j = 0; j < a4.size(); j++) {
        b4.append(j);
    }
    MyThread myThread4(a4, b4);    myThread4.start();
    for(int k =0;k<a.size();k++){
        Photo photo;
        photo.setName(a.at(k));
        model->photolist.append(photo);
    }
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    engine.rootContext()->setContextProperty("DataModel",model);
    engine.rootContext()->setContextProperty("DataModel2",model2);
    engine.rootContext()->setContextProperty("DataModel3",model3);
    engine.rootContext()->setContextProperty("DataModel4",model4);
    engine.rootContext()->setContextProperty("language",(QObject*)&myLanguage);
    if (engine.rootObjects().isEmpty())
        return -1;
    return app.exec();
}
