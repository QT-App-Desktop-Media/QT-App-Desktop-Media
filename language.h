#ifndef LANGUAGE_H
#define LANGUAGE_H
#include <QObject>
#include <QtGui>
#include <QTranslator>

class Language : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)
public:
    Language() {
        translator_vi = new QTranslator(this);
        translator_fr = new QTranslator(this);
    }
     QString getEmptyString() {
        return "";
    }
    Q_INVOKABLE void selectLanguage(QString language){
        if(language == QString("vi")){
            translator_vi->load(":/language_vi.qm");
            qApp->installTranslator(translator_vi);
        } else if(language == QString("fr")){
            translator_vi->load(":/language_fr.qm");
            qApp->installTranslator(translator_fr);
        }else {
            qApp->removeTranslator(translator_fr);
            qApp->removeTranslator(translator_vi);
        }
        emit languageChanged();
    }

private:
    QTranslator *translator_vi;
    QTranslator *translator_fr;

signals:
    void languageChanged();

public slots:
};

#endif // LANGUAGE_H
