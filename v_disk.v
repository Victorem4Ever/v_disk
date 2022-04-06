module v_disk

#include "windows.h"

fn C.GetLogicalDrives() byte

pub fn get_disks() []string {

	letters := ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
	mut disks := []string {}

	mut i := 0
	for i <= 26 {

		if (C.GetLogicalDrives() >> i) & 0x1 == 1{

			disks.insert(0, letters[i])

		}

		i += 1

	}

	return disks

}