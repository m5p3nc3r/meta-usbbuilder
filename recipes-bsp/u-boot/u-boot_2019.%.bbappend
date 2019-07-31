do_compile_prepend () {
  # Fix the boot script when booting from emmc because u-boot seens to enumerate
  # the sd-card and the emmc even if the sd-card is not present.
  if [ -n "${@bb.utils.contains('MACHINE_FEATURES', 'emmc', 'emmc', '', d)}" ]; then
    sed -i -e 's/mmcblk1p2/mmcblk0p2/g' -e 's/0:2/1:2/g' ${B}/boot.txt
  fi
}
