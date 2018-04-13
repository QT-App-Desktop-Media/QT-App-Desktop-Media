#include "photo.h"
QString Photo::getName() const {
    return name;
}
void Photo::setName(const QString &name){
    this->name = name;
}
