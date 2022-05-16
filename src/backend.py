from PySide2.QtCore import QObject, QThread, Signal, Slot

import serial

from time import sleep
from random import randint


map_devices = {
    "0177": "Device0", # Устройство 1
    "0277": "Device1", # Устройство 2
    "0477": "Device2", # Устройство 3
    "0701": "Device3", # Устройство 4
    "0e77": "Device4", # Устройство 5
    "1177": "Device5", # Устройство 5 DialControl
}


class WatchPort(QObject):
    """ Прослушивание COM порта """

    com_signal = Signal(str)
    close_com = Signal()
    
    def get_com_signal(self):
        """ Получение данных из COM порта """
        while True:
            port = serial.Serial('/dev/ttyUSB0', baudrate=38400)
            if port.isOpen():
                data = port.read(13).hex()
                self.com_signal.emit(data)
            else:
                self.close_com.emit()
                break

        self.close_com.emit()


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
        """ Обработчик данных пришедших от COM порта """

        bytes = [data[i:i+2] for i in range(0, len(data), 2)]
        bytes_formaited = f'{bytes[0]} {bytes[1]} {bytes[2]} {bytes[3]} {bytes[4]} {bytes[5]} {bytes[6]} {bytes[7]} {bytes[8]} {bytes[9]} {bytes[10]} {bytes[11]} {bytes[12]}'
        
        self.signalData.emit(bytes_formaited)

        try:
            print(bytes_formaited)
            device = map_devices[bytes[1] + bytes[2]]

            # Отправляем randint в dialControl
            if bytes[1] == '11' and bytes[2] == '77':
                bytes_formaited = randint(0, 500)

            getattr(self, "signal" + str(device)).emit(bytes_formaited)

        except KeyError:
            print(f'{ bytes_formaited } unknown device')


    @Slot(str)
    def front_btn_handler(self, data):
        """ Обработчик кнопок фронтенда """
        print(f'Front btn: {data}')

        if data == "01 01 77 19 00 00 00 00 00 6e ff 0d 0a":
            self.signalDevice5.emit(0)

        if data == "01 02 77 19 00 00 00 00 00 6d ff 0d 0a":
            self.signalDevice5.emit(800)

        if data == "01 04 77 19 00 00 00 00 00 6b ff 0d 0a":
            self.signalDevice5.emit(1000)

    @Slot(int)
    def dial_handler(self, data):
        """ Обработчик int """
        print(f'Dial: {data}')
        self.signalDevice5.emit(data)


    @Slot()
    def run(self):
        """ Запуск прослушивания COM порта в отдельном потоке"""
        self.thread = QThread()
        self.watch_port = WatchPort()
        self.watch_port.moveToThread(self.thread)

        self.thread.started.connect(self.watch_port.get_com_signal)
        self.watch_port.close_com.connect(self.thread.quit)
        self.watch_port.com_signal.connect(self.com_data_handler)

        self.thread.start()
