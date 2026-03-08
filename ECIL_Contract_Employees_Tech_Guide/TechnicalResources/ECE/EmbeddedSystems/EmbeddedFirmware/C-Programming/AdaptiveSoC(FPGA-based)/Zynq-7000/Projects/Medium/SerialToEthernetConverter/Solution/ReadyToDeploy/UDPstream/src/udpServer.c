/* UDP Chat Server - Refined for Zynq-7000 static IPv4 */

#include <stdio.h>
#include <string.h>

#include "lwip/err.h"
#include "lwip/pbuf.h"
#include "lwip/udp.h"

#include "xil_printf.h"
#include "xparameters.h"
#include "xuartps_hw.h"

// Port & Target
#define UDP_PORT 8888

// Globals
struct udp_pcb *udp_pcb_global;
ip_addr_t remote_ip;

// UART Buffer
static char buf[256];
static int idx = 0;

void print_app_header(void) {
    xil_printf("\r\n--- UDP Chat Server (Port %d) ---\r\n", UDP_PORT);
}

// Poll UART + Heartbeat + Send
int transfer_data(void) {
    // Heartbeat (~1 s)
    static int hb_counter = 0;
    const char *hb = "HEARTBEAT";
    hb_counter++;
    if (hb_counter > 10000000) {
        hb_counter = 0;
        struct pbuf *p = pbuf_alloc(PBUF_TRANSPORT, 9, PBUF_RAM);
        if (p) {
            memcpy(p->payload, hb, 9);
            udp_sendto(udp_pcb_global, p, &remote_ip, UDP_PORT);
            pbuf_free(p);
        }
    }

    if (XUartPs_IsReceiveData(STDOUT_BASEADDRESS)) {
        u8 c = XUartPs_ReadReg(STDOUT_BASEADDRESS, XUARTPS_FIFO_OFFSET);
        outbyte(c);                     // Echo to console

        if (c == '\r' || c == '\n') {
            if (idx > 0) {
                buf[idx] = 0;
                struct pbuf *p = pbuf_alloc(PBUF_TRANSPORT, idx, PBUF_RAM);
                if (p) {
                    memcpy(p->payload, buf, idx);
                    udp_sendto(udp_pcb_global, p, &remote_ip, UDP_PORT);
                    pbuf_free(p);
                    xil_printf("\r\n[SENT]\r\n");
                }
                idx = 0;
            } else {
                xil_printf("\r\n");
            }
        } else if (c == '\b' || c == 0x7F) {
            if (idx > 0) {
                idx--;
                xil_printf(" \b");
            }
        } else if (idx < 255) {
            buf[idx++] = c;
        }
    }
    return 0;
}

// UDP Receive Callback
void udp_recv_callback(void *arg, struct udp_pcb *tpcb,
                       struct pbuf *p, const ip_addr_t *addr, u16_t port) {
    if (p) {
        xil_printf("\r\n[RECV]: ");
        char *payload = (char *)p->payload;
        for (int i = 0; i < p->len; i++)
            outbyte(payload[i]);
        xil_printf("\r\n");
        pbuf_free(p);
    }
}

int start_application(void) {
    err_t err;

    udp_pcb_global = udp_new();
    if (!udp_pcb_global) {
        xil_printf("Error creating PCB\r\n");
        return -1;
    }

    err = udp_bind(udp_pcb_global, IP_ADDR_ANY, UDP_PORT);
    if (err != ERR_OK) {
        xil_printf("Bind failed: %d\r\n", err);
        return -2;
    }

    udp_recv(udp_pcb_global, udp_recv_callback, NULL);

    // Target client (static IPv4)
    IP4_ADDR(&remote_ip, 192, 168, 1, 111);

    xil_printf("Listening on %d. Target: 192.168.1.111:%d\r\n",
               UDP_PORT, UDP_PORT);
    return 0;
}
