from PySide2.QtCore import (
    QObject,
    QThread,
    Signal,
    Slot
    )

from time import sleep


map_devices = {
    "0177": "Device0", # Устройство 1
    "0277": "Device1", # Устройство 2
    "0477": "Device2", # Устройство 3
    "0701": "Device3", # Устройство 4
    "0e77": "Device4", # Устройство 5
    "0677": "Device5", # Устройство 5 DialControl
}


class WatchPort(QObject):
    """ Список данных COM порта: """

    com_signal = Signal(str)
    close_connect = Signal()

    com_data_lists = [
        '0101771900000000006eff0d0a',
        '0102771900000000006dff0d0a',
        '0104771900000000006bff0d0a',
        '01047719000000000069ff0d0a',
        '0107011900000000001eff0d0a',
        '01080119000000000011ff0d0a',
        '01090219000000000013ff0d0a',
        '010b7719000000000064ff0d0a',
        '0112771900000000007dff0d0a',
        '010e7719000000000061ff0d0a',
        '010f7719000000000060ff0d0a',
        '0110771900000000007fff0d0a',
        '0111771900000000007eff0d0a',
        # Data for DialControl
        '01067719010200000069ff0d0a',
        '01067719030200000069ff0d0a',
        '01067719050200000069ff0d0a',
        '01067719070200000069ff0d0a',
        '01067719080200000069ff0d0a',
        '01067719090200000069ff0d0a',
        '01067719000020000069ff0d0a',
    ]

    def com_emulator(self):
        #Эмуляция порта COM:
        for data in self.com_data_lists:
            sleep(1)
            self.com_signal.emit(data)
        self.close_connect.emit()



class Controller(QObject):
    """ Обрабатываем сигналы и слоты """
    def __init__(self):
        QObject.__init__(self)

    # Signals
    signalData = Signal(str)
    signalDevice0 = Signal(str)
    signalDevice1 = Signal(str)
    signalDevice2 = Signal(str)
    signalDevice3 = Signal(str)
    signalDevice4 = Signal(str)
    signalDevice5 = Signal(int)


    def com_data_handler(self, data):
        bytes = [data[i:i+2] for i in range(0, len(data), 2)]
        bytes_formaited = f'{bytes[0]} {bytes[1]} {bytes[2]} {bytes[3]} {bytes[4]} {bytes[5]} {bytes[6]} {bytes[7]} {bytes[8]} {bytes[9]} {bytes[10]} {bytes[11]} {bytes[12]}'
        
        self.signalData.emit(bytes_formaited)

        try:
            device = map_devices[bytes[1] + bytes[2]]

            # Если 3 байта не равны нулю, то отправляем значение
            if bytes[5] != '00':
                bytes_formaited = int(bytes[4] + bytes[5], 16) / 5
            
            getattr(self, "signal" + str(device)).emit(bytes_formaited)
        except KeyError:
            print('Неизвестное устройство')


    @Slot()
    def run(self):
        """ Запуск потока """
        self.thread = QThread()
        self.watch_port = WatchPort()
        self.watch_port.moveToThread(self.thread)

        self.thread.started.connect(self.watch_port.com_emulator)
        self.watch_port.close_connect.connect(self.thread.quit)
        self.watch_port.com_signal.connect(self.com_data_handler)

        self.thread.start()
