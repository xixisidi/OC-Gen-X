import Foundation

var ryzenPatch1 = kPatch(base: "_cpuid_set_info", comment: "algrey - Force cpuid_cores_per_package 10.13,10.14", count: 1, find: Data([0xC1, 0xE8, 0x1A, 0x00, 0x00, 0x00]), mask: Data([0xFF, 0xFD, 0xFF, 0x00, 0x00, 0x00]), maxKernel: "18.99.99", minKernel: "17.0.0", replaceMask: Data([0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00]))

var ryzenPatch2 = kPatch(base: "_cpuid_set_info", comment: "algrey - Force cpuid_cores_per_package 10.15,11.0", count: 1, find: Data([0xC1,0xE8,0x1A,0x00, 0x00,0x00]), mask: Data([0xFF,0xFD,0xFF,0x00, 0x00,0x00]), maxKernel: "20.99.99", minKernel: "19.0.0", replaceMask: Data([0xFF,0xFF,0xFF,0xFF, 0xFF,0x00]))

var ryzenPatch3 = kPatch(base: "_cpuid_set_info", comment: "algrey - Force cpuid_cores_per_package 12.0", count: 1, find: Data([0xC1,0xE8,0x1A,0x00, 0x00,0x00]), mask: Data([0xFF,0xFD,0xFF,0x00, 0x00,0x00]), maxKernel: "21.99.99", minKernel: "21.0.0", replaceMask: Data([0xFF,0xFF,0xFF,0xFF, 0xFF,0xFF]))

var ryzenPatch4 = kPatch(comment: "algrey - _commpage_populate - Remove rdmsr - 10.13/10.14/10.15/11.0/12.0", count: 1, find: Data([0xB9,0xA0,0x01,0x00, 0x00,0x0F,0x32]), mask: Data(), maxKernel: "21.99.99", minKernel: "17.0.0", replace: Data([0x0F,0x1F,0x80,0x00, 0x00,0x00,0x00]), replaceMask: Data())

var ryzenPatch5 = kPatch(comment: "algrey - _cpuid_set_cache_info - Set cpuid to 0x8000001D instead 4 - 10.13/10.14/10.15/11.0/12.0", count: 1, find: Data([0xB8,0x04,0x00,0x00, 0x00,0x44,0x89,0xF1, 0x44,0x89]), mask: Data(), maxKernel: "21.99.99", minKernel: "17.0.0", replace: Data([0xB8,0x1D,0x00,0x00, 0x80,0x44,0x89,0xF1,0x44,0x89]), replaceMask: Data())
    
var ryzenPatch6 = kPatch(comment: "algrey - _cpuid_set_generic_info - Remove wrmsr - 10.13/10.14/10.15/11.0/12.0", count: 1, find: Data([0xB9,0x8B,0x00,0x00, 0x00,0x31,0xC0,0x31, 0xD2,0x0F,0x30]), mask: Data(), maxKernel: "21.99.99", minKernel: "17.0.0", replace: Data([0x66,0x0F,0x1F,0x84, 0x00,0x00,0x00,0x00, 0x00,0x66,0x90]), replaceMask: Data())

var ryzenPatch7 = kPatch(comment: "algrey - _cpuid_set_generic_info - Set microcode=186 - 10.13/10.14/10.15/11.0/12.0", count: 1, find: Data([0xB9,0x8B,0x00,0x00, 0x00,0x0F,0x32]), mask: Data(), maxKernel: "21.99.99", minKernel: "17.0.0", replace: Data([0xBA,0xBA,0x00,0x00, 0x00,0x66,0x90]), replaceMask: Data())
    
var ryzenPatch8 = kPatch(comment: "algrey - _cpuid_set_generic_info - Set flag=1 - 10.13/10.14/10.15/11.0/12.0", count: 1, find: Data([0xB9,0x17,0x00,0x00, 0x00,0x0F,0x32,0xC1, 0xEA,0x12,0x80,0xE2, 0x07]), mask: Data(), maxKernel: "21.99.99", minKernel: "17.0.0", replace: Data([0xB2,0x01,0x66,0x0F, 0x1F,0x84,0x00,0x00, 0x00,0x00,0x00,0x66, 0x90]), replaceMask: Data())

var ryzenPatch9 = kPatch(comment: "algrey - _cpuid_set_info - GenuineIntel to AuthenticAMD - 10.13/10.14/10.15/11.0", count: 1, find: Data([0x47,0x65,0x6E,0x75, 0x69,0x6E,0x65,0x49, 0x6E,0x74,0x65,0x6C, 0x00]), mask: Data(), maxKernel: "20.99.99", minKernel: "17.0.0", replace: Data([0x41,0x75,0x74,0x68, 0x65,0x6E,0x74,0x69, 0x63,0x41,0x4D,0x44, 0x00]), replaceMask: Data())

var ryzenPatch10 = kPatch(comment: "Goldfish64 - Bypass GenuineIntel check panic - 12.0", count: 1, find: Data([0xB9,0x6E,0x00,0x00, 0x00,0x0F,0xBE,0xC0, 0x39,0xC1,0x00,0x00, 0x00,0x00,0x00,0x00]), mask: Data([0xFF,0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF,0xFF, 0xFF,0xFF,0x00,0x00, 0x00,0x00,0x00,0x00]), maxKernel: "21.99.99", minKernel: "21.0.0", replace: Data([0xB9,0x6E,0x00,0x00, 0x00,0x0F,0xBE,0xC0, 0x39,0xC1,0x90,0x90, 0x90,0x90,0x90,0x90]), replaceMask: Data())

var ryzenPatch11 = kPatch(comment: "algrey - _cpuid_set_cpufamily - Force CPUFAMILY_INTEL_PENRYN - 10.13/10.14/10.15/11.2", count: 1, find: Data([0x31,0xDB,0x80,0x3D, 0x00,0x00,0x00,0x00, 0x06,0x75,0x00]), mask: Data([0xFF,0xFF,0xFF,0xFF, 0x00,0x00,0x00,0xFF, 0xFF,0xFF,0x00]), maxKernel: "20.3.0", minKernel: "17.0.0", replace: Data([0xBB,0xBC,0x4F,0xEA, 0x78,0xE9,0x5D,0x00, 0x00,0x00,0x90]), replaceMask: Data())

var ryzenPatch12 = kPatch(base: "_cpuid_set_info", comment: "algrey - _cpuid_set_cpufamily - Force CPUFAMILY_INTEL_PENRYN - 11.3 + / 12.0", count: 1, find: Data([0x80,0x3D,0x00,0x00, 0x00,0x00,0x06,0x75]), mask: Data([0xFF,0xFF,0x00,0x00, 0x00,0x00,0xFF,0xFF]), maxKernel: "21.99.99", minKernel: "20.4.0", replace: Data([0xBA,0xBC,0x4F,0xEA, 0x78,0x31,0xDB,0xEB]), replaceMask: Data())

var ryzenPatch13 = kPatch(comment: "algrey - _i386_init - Remove rdmsr (x3) - 10.13/10.14/10.15/11.0/12.0", find: Data([0xB9,0x99,0x01,0x00, 0x00,0x0F,0x32,0x48, 0xC1,0xE2,0x20,0x89, 0xC6,0x48,0x09,0xD6,0xB9,0x98,0x01,0x00, 0x00,0x0F,0x32,0x48, 0xC1,0xE2,0x20,0x89, 0xC0,0x48,0x09,0xC2, 0xBF,0x58,0x02,0x31, 0x05,0x31,0xC9,0x45, 0x31,0xC0]), mask: Data(), maxKernel: "21.99.99", minKernel: "17.0.0", replace: Data([0x66,0x0F,0x1F,0x84, 0x00,0x00,0x00,0x00, 0x00,0x66,0x0F,0x1F, 0x84,0x00,0x00,0x00, 0x00,0x00,0x66,0x0F, 0x1F,0x84,0x00,0x00, 0x00,0x00,0x00,0x66, 0x0F,0x1F,0x84,0x00, 0x00,0x00,0x00,0x00, 0x66,0x0F,0x1F,0x44, 0x00,0x00]), replaceMask: Data())

var ryzenPatch14 = kPatch(comment: "algrey/XLNC - Remove version check and panic", count: 1, find: Data([0x25,0xFC,0x00,0x00, 0x00,0x83,0xF8,0x13]), mask: Data(), maxKernel: "21.99.99", minKernel: "17.0.0", replace: Data([0x25,0xFC,0x00,0x00, 0x00,0x0F,0x1F,0x00]), replaceMask: Data())

var ryzenPatch15 = kPatch(comment: "algrey - _mtrr_update_action fix PAT - 10.13/10.14/10.15/11.0/12.0", find: Data([0x89,0xC0,0x81,0xE2, 0xFF,0xFF,0x00,0xFF, 0x81,0xCA,0x00,0x00, 0x01,0x00,0xB9,0x77, 0x02,0x00,0x00]), mask: Data([0xFF,0xFF,0xFF,0xFF, 0xFF,0xFF,0x0F,0xFF, 0xFF,0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF]), maxKernel: "21.99.99", minKernel: "17.0.0", replace: Data([0xB9,0x77,0x02,0x00, 0x00,0xB8,0x06,0x01, 0x07,0x00,0xBA,0x06, 0x01,0x07,0x00,0x0F, 0x1F,0x40,0x00]), replaceMask: Data())

var ryzenPatch16 = kPatch(comment: "Shaneee - _mtrr_update_action fix PAT - 10.13/10.14/10.15/11.0/12.0", enabled: false, find: Data([0x89,0xC0,0x81,0xE2, 0xFF,0xFF,0x00,0xFF, 0x81,0xCA,0x00,0x00, 0x01,0x00,0xB9,0x77, 0x02,0x00,0x00]), mask: Data([0xFF,0xFF,0xFF,0xFF, 0xFF,0xFF,0x0F,0xFF, 0xFF,0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF]), maxKernel: "21.99.99", minKernel: "17.0.0", replace: Data([0xB9,0x77,0x02,0x00, 0x00,0xB8,0x06,0x06, 0x06,0x06,0xBA,0x06, 0x06,0x06,0x06,0x0F, 0x30,0x0F,0x09]), replaceMask: Data())
