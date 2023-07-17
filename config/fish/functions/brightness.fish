function brightness
  ddccontrol -r 0x10 -w $argv dev:/dev/i2c-4
end

