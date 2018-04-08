#include <QCoreApplication>
#include <QTcpServer>
#include <QTcpSocket>
#include <QHostInfo>

#include <QCommandLineParser>
#include <QCommandLineOption>

#include <unistd.h>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
	a.setApplicationName("finderd");
	a.setApplicationVersion("1.0");
	a.setOrganizationName("fr.lbaudouin");

	QCommandLineParser parser;
    parser.setApplicationDescription("Finder daemon");
    parser.addHelpOption();
    parser.addVersionOption();

    QCommandLineOption noDetachOption(QStringList() << "n" << "nodetach",
                                      QCoreApplication::translate("main", "Don't run as daemon in background"));
    parser.addOption( noDetachOption);

    parser.process( qApp->arguments() );

    bool useDeamon = !parser.isSet( noDetachOption );
    if(useDeamon){
        daemon(0, 0);
    }

    QTcpServer server;
    server.listen(QHostAddress::Any, 17000);
    QObject::connect(&server, &QTcpServer::newConnection, [&server](){
        server.nextPendingConnection()->write(QHostInfo::localHostName().toUtf8());
    } );

    return a.exec();
}

