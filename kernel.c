#define UART0 0x10000000UL

void uart_putc(char c) {
    *(volatile char*)UART0 = c;
}

void putstr(const char *s) {
    while (*s) uart_putc(*s++);
}

void _starts() {
    putstr("\033c\033[43;30m\nhello world from serial port\n");
    while(1) {}
}