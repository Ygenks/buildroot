#!/bin/bash

OUTPUT_DIR=$1

if ! test -d "${OUTPUT_DIR}" ; then
    echo "ERROR: no output directory specified."
    echo "Usage: $0 OUTPUT_DIR"
    exit 1
fi

${OUTPUT_DIR}/host/bin/openocd -f board/stm32f469i-disco.cfg \
  -c "init" \
  -c "reset init" \
  -c "flash probe 0" \
  -c "flash probe 1" \
  -c "flash probe 2" \
  -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f469i-disco.bin 0x08000000" \
  -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f469-disco.dtb 0x08004000" \
  -c "flash write_image erase ${OUTPUT_DIR}/images/xipImage 0x90000000" \
  -c "flash verify_image ${OUTPUT_DIR}/images/stm32f469i-disco.bin 0x08000000" \
  -c "flash verify_image ${OUTPUT_DIR}/images/stm32f469-disco.dtb 0x08004000" \
  -c "flash verify_image ${OUTPUT_DIR}/images/xipImage 0x90000000" \
  -c "reset run" \
  -c "shutdown"
