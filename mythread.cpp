#include "mythread.h"

#include <QList>
#include <QString>
#include <QDebug>

MyThread::MyThread(QList<QString> qL, QList<int> a)
{
    this->qList = qL;
    this->qInt = a;
}

void MyThread::run()
{
    for(int i = 0; i < this->qList.size(); i++) {
        qDebug() <<"+"<< this->qInt.at(i) <<" "<< this->qList.at(i);
        QThread::msleep(500);
    }
}


