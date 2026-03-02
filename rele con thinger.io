#include <WiFi.h>
#include <ThingerESP32.h>

#define USERNAME "Danielpucha18"
#define DEVICE_ID "esp32_led"
#define DEVICE_CREDENTIAL "123456789"

#define SSID "iPhone de daniel"
#define SSID_PASSWORD "12345678"

ThingerESP32 thing(USERNAME, DEVICE_ID, DEVICE_CREDENTIAL);

const int rele = 15;
bool estado = false;

void setup() {
pinMode(rele, OUTPUT);
digitalWrite(rele, LOW);

thing.add_wifi(SSID, SSID_PASSWORD);

thing["rele"] << [](pson &in){
if(in.is_empty()) {
in = estado;
} else {
estado = in;
digitalWrite(rele, estado);
}
};
}

void loop() {
thing.handle();
}