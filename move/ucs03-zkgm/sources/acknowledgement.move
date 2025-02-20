module zkgm::acknowledgement {
    use zkgm::zkgm_ethabi;

    use std::vector;

    struct Acknowledgement has copy, drop, store {
        tag: u256,
        inner_ack: vector<u8>
    }

    public fun new(tag: u256, inner_ack: vector<u8>): Acknowledgement {
        Acknowledgement { tag, inner_ack }
    }

    public fun tag(ack: &Acknowledgement): u256 {
        ack.tag
    }

    public fun inner_ack(ack: &Acknowledgement): &vector<u8> {
        &ack.inner_ack
    }

    public fun encode(ack: &Acknowledgement): vector<u8> {
        let buf = vector::empty<u8>();
        zkgm_ethabi::encode_uint<u256>(&mut buf, ack.tag);

        let inner_ack_offset = 0x40;
        zkgm_ethabi::encode_uint<u32>(&mut buf, inner_ack_offset);
        zkgm_ethabi::encode_bytes(&mut buf, &ack.inner_ack);


        buf
    }

    public fun decode(buf: &vector<u8>): Acknowledgement {
        let index = 0;
        let tag = zkgm_ethabi::decode_uint(buf, &mut index);
        index = index + 0x20;
        let inner_ack = zkgm_ethabi::decode_bytes(buf, &mut index);
        Acknowledgement { tag: tag, inner_ack: inner_ack }
    }

    #[test]
    fun test_encode_decode_ack() {
        let output =
            x"000000000000000000000000000000000000000000000000000007157f2addb00000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000768656c6c6c6f6f00000000000000000000000000000000000000000000000000";
        let ack_data = Acknowledgement { tag: 7788909223344, inner_ack: b"hellloo" };

        let ack_bytes = encode(&ack_data);
        assert!(ack_bytes == output, 0);

        let ack_data_decoded = decode(&ack_bytes);
        assert!(ack_data_decoded.tag == 7788909223344, 1);
        assert!(ack_data_decoded.inner_ack == b"hellloo", 3);
    }

    #[test]
    fun test_see_ack(){
        let output = x"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000";

        let ack_data_decoded = decode(&output);
        std::debug::print(&ack_data_decoded);
    }
}
