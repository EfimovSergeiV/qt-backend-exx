from PySide2.QtCore import (
    QObject,
    QThread,
    Signal,
    Slot
    )

from time import sleep


map_devices = {
    "device0": ["01", "01", "77"], # Устройство 1
    "device1": ["01", "02", "77"], # Устройство 2
    "device2": ["01", "04", "77"], # Устройство 3
    "device3": ["01", "07", "77"], # Устройство 4
    "device4": ["01", "08", "77"], # Устройство 5
}


class WatchPort(QObject):
    #Список данных COM порта:

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
        '01067719000000000069ff0d0a',        
    ]

    def com_emulator(self):
        #Эмуляция порта COM:
        for data in self.com_data_lists:
            print(data)
            sleep(0.5)
            self.com_signal.emit(data)
        self.close_connect.emit()



class Controller(QObject):
    """ Обрабатываем сигналы и слоты """
    def __init__(self):
        QObject.__init__(self)

    # Signals
    allData = Signal(str)
    dataDevice0 = Signal(str)
    dataDevice1 = Signal(str)
    dataDevice2 = Signal(str)
    dataDevice3 = Signal(str)
    dataDevice4 = Signal(str)


    def com_data_handler(self, data):
        bytes = [data[i:i+2] for i in range(0, len(data), 2)]
        bytes_formaited = f'{bytes[0]} {bytes[1]} {bytes[2]} {bytes[3]} {bytes[4]} {bytes[5]} {bytes[6]} {bytes[7]} {bytes[8]} {bytes[9]} {bytes[10]} {bytes[11]} {bytes[12]}'
        
        self.allData.emit(bytes_formaited)

        # Отображаем данные по каждому устройству:
        # if bytes[0] == map_devices["device0"][0] and bytes[1] == map_devices["device0"][1] and bytes[2] == map_devices["device0"][2]:
        for device, data_device in map_devices.items():
            if data_device == bytes[:3]:
                device_signal = "dataDevice" + str(device[-1:]) # :-)
                # getattr(self, device_signal).emit(bytes_formaited)
                self.__getattribute__(device_signal).emit(bytes_formaited)


    @Slot()
    def run(self):
        self.thread = QThread()
        self.watch_port = WatchPort()
        self.watch_port.moveToThread(self.thread)

        self.thread.started.connect(self.watch_port.com_emulator)

        self.watch_port.com_signal.connect(self.com_data_handler)

        self.thread.start()
