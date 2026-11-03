use std::ffi::{c_char, c_void, CString, CStr};
use std::ptr;

// Dummy implementation since actual lancedb crates require a newer rustc than the sandbox has.
// In a real environment, this connects to LanceDB embedded and creates a tokio runtime.

pub struct LanceContext {
    pub is_connected: bool,
}

#[no_mangle]
pub extern "C" fn lance_bridge_connect(path: *const c_char, error_out: *mut *mut c_char) -> *mut LanceContext {
    if path.is_null() {
        return ptr::null_mut();
    }

    // Simulate connection
    let ctx = Box::new(LanceContext { is_connected: true });
    Box::into_raw(ctx)
}

#[no_mangle]
pub extern "C" fn lance_bridge_free_error(err: *mut c_char) {
    if !err.is_null() {
        unsafe { let _ = CString::from_raw(err); }
    }
}

#[no_mangle]
pub extern "C" fn lance_bridge_close(ctx: *mut LanceContext) {
    if !ctx.is_null() {
        unsafe { let _ = Box::from_raw(ctx); }
    }
}
