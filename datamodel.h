#ifndef DATAMODEL_H
#define DATAMODEL_H

#include <QAbstractListModel>
#include "photo.h"
class DataModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit DataModel(QObject *parent = nullptr);

    // Basic functionality:
    QList<Photo> photolist;
    enum RoleNames{
        NAME_ROLE = Qt::UserRole+1,
    };
    virtual QHash<int, QByteArray> roleNames() const override;
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
private:
};

#endif
