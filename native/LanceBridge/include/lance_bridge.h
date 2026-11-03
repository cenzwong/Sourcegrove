#ifndef LANCE_BRIDGE_H
#define LANCE_BRIDGE_H

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct LanceContext LanceContext;

LanceContext* lance_bridge_connect(const char* path, char** error_out);
void lance_bridge_free_error(char* err);
void lance_bridge_close(LanceContext* ctx);

#ifdef __cplusplus
}
#endif

#endif // LANCE_BRIDGE_H
