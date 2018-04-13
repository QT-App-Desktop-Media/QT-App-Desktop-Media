#ifndef PHOTO_H
#define PHOTO_H
#include <QObject>

class Photo
{
private:
    QString name;
public:
    QString getName() const;
    void setName(const QString &name);
};

#endif
