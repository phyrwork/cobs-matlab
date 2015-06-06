## cobs-matlab
# Consistent Overhead Byte Stuffing for MATLAB

[Consistent Overhead Byte Stuffing (COBS)](http://en.wikipedia.org/wiki/Consistent_Overhead_Byte_Stuffing) is an encoding that removes all zero bytes from arbitrary binary data. The encoded data consists only of bytes with values from 0x01 to 0xFF. This is useful for preparing data for transmission over a serial link (RS-232 or RS-485 for example), as the 0 byte can be used to unambiguously indicate packet boundaries. COBS also has the advantage of adding very little overhead (at least 1 byte, plus up to an additional byte per 254 bytes of data) and being computationally efficient.

This implementation for MATLAB operates on complete message blocks only. A streaming implementation, which may be useful in modelling memory-restricted hardware implementations, is also available: [Streaming Consistent Overhead Byte Stuffing (COBS) for MATLAB](https://github.com/phyrwork/cobss-matlab)

# Usage

	coded_msg = cobs(msg); % encode a message block
	msg = cobsi(coded_msg); % decode a coded message block

Corruption of the byte-stuffing symbols will cause an out-of-bounds access and cause decoding to fail.