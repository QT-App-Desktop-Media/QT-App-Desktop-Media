#include "datamodel.h"
DataModel::DataModel(QObject *parent)
    : QAbstractListModel(parent)
{

}
QHash<int, QByteArray> DataModel::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[NAME_ROLE] = "namefile";
    return roles;
}
int DataModel::rowCount(const QModelIndex &parent)  const
{
    Q_UNUSED(parent);
    return photolist.count();

}
QVariant DataModel::data(const QModelIndex &index, int role) const {
    QVariant data = QVariant();
    int i = index.row();
    if(i>-1&&i<photolist.count()){
    Photo photo = photolist.at(i);
    switch (role) {
    case NAME_ROLE:
        data = photo.getName();
        break;
        }
    }
    return data;
}
