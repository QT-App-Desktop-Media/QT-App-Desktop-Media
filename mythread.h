#ifndef MYTHREAD_H
#define MYTHREAD_H

#include <QThread>
#include <QList>
#include <QString>

class MyThread: public QThread
{
public:
    explicit MyThread(QList<QString> qL, QList<int> qI);

    void run();

private:
    QList<QString> qList;
    QList<int> qInt;
};

#endif // MYTHREAD_H
