#ifndef IDATABASE_H
#define IDATABASE_H

#include <QObject>
#include <QtSql>
#include <QSqlDatabase>
#include <QDataWidgetMapper>

class IDatabase : public QObject
{
    Q_OBJECT
public:

    static IDatabase &getInstance()
    {
        static IDatabase instance;
        return instance;
    }

    QString userLogin(QString userName, QString password);

private:
    explicit IDatabase(QObject *parent = nullptr);
    IDatabase(IDatabase const &) = delete;
    void operator = (IDatabase const &) = delete;

    QSqlDatabase database;

    void initDatabase();
    void createTables();


signals:

public:
    bool initPatientMoble();
    int addNewPatient();
    bool searchPatient(QString filter);
    bool deleteCurrentPatient();
    bool submiPatientEdit();
    void revertPatientEdit();

    QSqlTableModel *patientTabMoble;
    QItemSelectionModel *thePatientSelection;

};

#endif // IDATABASE_H
