require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&__ASM_POWERPC_CPUTABLE_H)) {
    eval 'sub __ASM_POWERPC_CPUTABLE_H () {1;}' unless defined(&__ASM_POWERPC_CPUTABLE_H);
    eval 'sub PPC_FEATURE_32 () {0x80000000;}' unless defined(&PPC_FEATURE_32);
    eval 'sub PPC_FEATURE_64 () {0x40000000;}' unless defined(&PPC_FEATURE_64);
    eval 'sub PPC_FEATURE_601_INSTR () {0x20000000;}' unless defined(&PPC_FEATURE_601_INSTR);
    eval 'sub PPC_FEATURE_HAS_ALTIVEC () {0x10000000;}' unless defined(&PPC_FEATURE_HAS_ALTIVEC);
    eval 'sub PPC_FEATURE_HAS_FPU () {0x8000000;}' unless defined(&PPC_FEATURE_HAS_FPU);
    eval 'sub PPC_FEATURE_HAS_MMU () {0x4000000;}' unless defined(&PPC_FEATURE_HAS_MMU);
    eval 'sub PPC_FEATURE_HAS_4xxMAC () {0x2000000;}' unless defined(&PPC_FEATURE_HAS_4xxMAC);
    eval 'sub PPC_FEATURE_UNIFIED_CACHE () {0x1000000;}' unless defined(&PPC_FEATURE_UNIFIED_CACHE);
    eval 'sub PPC_FEATURE_HAS_SPE () {0x800000;}' unless defined(&PPC_FEATURE_HAS_SPE);
    eval 'sub PPC_FEATURE_HAS_EFP_SINGLE () {0x400000;}' unless defined(&PPC_FEATURE_HAS_EFP_SINGLE);
    eval 'sub PPC_FEATURE_HAS_EFP_DOUBLE () {0x200000;}' unless defined(&PPC_FEATURE_HAS_EFP_DOUBLE);
    eval 'sub PPC_FEATURE_NO_TB () {0x100000;}' unless defined(&PPC_FEATURE_NO_TB);
    eval 'sub PPC_FEATURE_POWER4 () {0x80000;}' unless defined(&PPC_FEATURE_POWER4);
    eval 'sub PPC_FEATURE_POWER5 () {0x40000;}' unless defined(&PPC_FEATURE_POWER5);
    eval 'sub PPC_FEATURE_POWER5_PLUS () {0x20000;}' unless defined(&PPC_FEATURE_POWER5_PLUS);
    eval 'sub PPC_FEATURE_CELL () {0x10000;}' unless defined(&PPC_FEATURE_CELL);
    eval 'sub PPC_FEATURE_BOOKE () {0x8000;}' unless defined(&PPC_FEATURE_BOOKE);
    eval 'sub PPC_FEATURE_SMT () {0x4000;}' unless defined(&PPC_FEATURE_SMT);
    eval 'sub PPC_FEATURE_ICACHE_SNOOP () {0x2000;}' unless defined(&PPC_FEATURE_ICACHE_SNOOP);
    eval 'sub PPC_FEATURE_ARCH_2_05 () {0x1000;}' unless defined(&PPC_FEATURE_ARCH_2_05);
    eval 'sub PPC_FEATURE_PA6T () {0x800;}' unless defined(&PPC_FEATURE_PA6T);
    eval 'sub PPC_FEATURE_HAS_DFP () {0x400;}' unless defined(&PPC_FEATURE_HAS_DFP);
    eval 'sub PPC_FEATURE_POWER6_EXT () {0x200;}' unless defined(&PPC_FEATURE_POWER6_EXT);
    eval 'sub PPC_FEATURE_ARCH_2_06 () {0x100;}' unless defined(&PPC_FEATURE_ARCH_2_06);
    eval 'sub PPC_FEATURE_HAS_VSX () {0x80;}' unless defined(&PPC_FEATURE_HAS_VSX);
    eval 'sub PPC_FEATURE_PSERIES_PERFMON_COMPAT () {0x40;}' unless defined(&PPC_FEATURE_PSERIES_PERFMON_COMPAT);
    eval 'sub PPC_FEATURE_TRUE_LE () {0x2;}' unless defined(&PPC_FEATURE_TRUE_LE);
    eval 'sub PPC_FEATURE_PPC_LE () {0x1;}' unless defined(&PPC_FEATURE_PPC_LE);
}
1;
