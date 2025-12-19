#include "patientview.h"
#include "ui_patientview.h"
#include "idatabase.h"

PatientView::PatientView(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::PatientView)
{
    ui->setupUi(this);

    ui->tableView->setSelectionBehavior(QAbstractItemView::SelectRows);
    ui->tableView->setSelectionMode(QAbstractItemView::SingleSelection);
    ui->tableView->setEditTriggers(QAbstractItemView::NoEditTriggers);
    ui->tableView->setAlternatingRowColors(true);

    IDatabase &iDatabase = IDatabase::getInstance();
    if(iDatabase.initPatientMoble()){
        ui->tableView->setModel(iDatabase.patientTabMoble);
        ui->tableView->setSelectionModel(iDatabase.thePatientSelection);
        
        // 设置中文表头
        iDatabase.patientTabMoble->setHeaderData(1, Qt::Horizontal, "姓名");
        iDatabase.patientTabMoble->setHeaderData(2, Qt::Horizontal, "身份证号");
        iDatabase.patientTabMoble->setHeaderData(3, Qt::Horizontal, "身高");
        iDatabase.patientTabMoble->setHeaderData(4, Qt::Horizontal, "体重");
        iDatabase.patientTabMoble->setHeaderData(5, Qt::Horizontal, "手机号");
        iDatabase.patientTabMoble->setHeaderData(6, Qt::Horizontal, "出生日期");
        iDatabase.patientTabMoble->setHeaderData(7, Qt::Horizontal, "性别");
    }
}

PatientView::~PatientView()
{
    delete ui;
}

void PatientView::on_btAdd_clicked()
{
    int currow = IDatabase::getInstance().addNewPatient();
    emit goPatientEditView(currow);
}


void PatientView::on_btSearch_clicked()
{
    QString filter = QString("name like '%%1%'").arg(ui->txtSearch->text());
    IDatabase::getInstance().searchPatient(filter);
}


void PatientView::on_btDelete_clicked()
{
    IDatabase::getInstance().deleteCurrentPatient();
}


void PatientView::on_btEdit_clicked()
{
    QModelIndex curIndex = IDatabase::getInstance().thePatientSelection->currentIndex();
    emit goPatientEditView(curIndex.row());
}

