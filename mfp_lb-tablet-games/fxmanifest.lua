fx_version 'cerulean'
game 'gta5'

lua54 "yes"
use_experimental_fxv2_oal "yes"

name "MFP LB-Tablet-Game App"
author 'MFPSCRIPTS'
description 'LB Tablet Game App'
version '1.0.0'

files {
    "html/*.*",
    "html/**/*.*"
}

shared_script {
    "config/*.lua",
}

client_scripts {
    "client/*.lua"
}


escrow_ignore {
    "config/**/*.lua"
}