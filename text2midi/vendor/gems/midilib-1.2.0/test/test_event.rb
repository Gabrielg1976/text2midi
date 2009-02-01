# Start looking for MIDI classes in the directory above this one.
# This forces us to use the local copy of MIDI, even if there is
# a previously installed version out there somewhere.
$LOAD_PATH[0, 0] = File.join(File.dirname(__FILE__), '..', 'lib')

require 'test/unit'
require 'midilib'

class EventTester < Test::Unit::TestCase

    def test_note_on
	e = MIDI::NoteOnEvent.new
	assert_equal(MIDI::NOTE_ON, e.status)
	assert_equal(0, e.channel)
	assert_equal(64, e.note)
	assert_equal(64, e.velocity)
	assert_equal(0, e.delta_time)
	assert_equal(0, e.time_from_start)
    end

    def test_quantize
	e = MIDI::NoteOnEvent.new
	e.quantize_to(4)
	assert_equal(0, e.time_from_start)

	# Each value in this array is the expected quantized value of
	# its index in the array.

	# Test with quantize_to(4)
	[0, 0, 4, 4, 4, 4, 8, 8, 8, 8, 12, 12, 12, 12, 16].each_with_index {
	    | after, before |
	    e.time_from_start = before
	    e.quantize_to(4)
	    assert_equal(after, e.time_from_start)
	}

	# Test with quantize_to(6)
	[0, 0, 0, 6, 6, 6, 6, 6, 6, 12, 12, 12, 12, 12, 12,
	 18, 18, 18, 18, 18, 18, 24].each_with_index {
	    | after, before |
	    e.time_from_start = before
	    e.quantize_to(6)
	    assert_equal(after, e.time_from_start)
	}
    end

    def test_to_s
	e = MIDI::NoteOnEvent.new
	assert_equal("0: ch 00 on 40 40", e.to_s)
	e.print_decimal_numbers = true
	assert_equal("0: ch 0 on 64 64", e.to_s)
	e.print_note_names = true
	assert_equal("0: ch 0 on E4 64", e.to_s)
	e.print_decimal_numbers = false
	assert_equal("0: ch 00 on E4 40", e.to_s)
    end

    def test_bools_note_on
      e = MIDI::NoteOnEvent.new
      assert(e.channel?)
      assert(e.note?)
      assert(e.note_on?)
      assert(!e.note_off?)
      assert(!e.meta?)
      assert(!e.system?)
      assert(!e.realtime?)
    end

    def test_bools_note_off
      e = MIDI::NoteOffEvent.new
      assert(e.channel?)
      assert(e.note?)
      assert(!e.note_on?)
      assert(e.note_off?)
      assert(!e.meta?)
      assert(!e.system?)
      assert(!e.realtime?)
    end

    def test_bools_realtime
      e = MIDI::Clock.new
      assert(!e.channel?)
      assert(!e.note?)
      assert(!e.meta?)
      assert(!e.system?)
      assert(e.realtime?)
    end

    def test_bools_controller
      e = MIDI::Controller.new
      assert(e.channel?)
      assert(!e.note?)
      assert(!e.meta?)
      assert(!e.system?)
      assert(!e.realtime?)
    end

    def test_bools_meta
      e = MIDI::MetaEvent.new(MIDI::META_SEQ_NUM)
      assert(!e.channel?)
      assert(!e.note?)
      assert(e.meta?)
      assert(!e.system?)
      assert(!e.realtime?)
    end

    def test_bools_system
      e = MIDI::TuneRequest.new
      assert(!e.channel?)
      assert(!e.note?)
      assert(!e.meta?)
      assert(e.system?)
      assert(!e.realtime?)
    end

    def test_pitch_bend
      e = MIDI::PitchBend.new(0, 128)
      b = e.data_as_bytes
      assert_equal(0, b[1])	# lsb, 7 bits
      assert_equal(1, b[2])	# msb, 7 bits

      e.value = (3 << 7) + 42
      b = e.data_as_bytes
      assert_equal(42, b[1])	# lsb, 7 bits
      assert_equal(3, b[2])	# msb, 7 bits
    end

    def test_quantize
	e = MIDI::NoteOnEvent.new(0, 64, 64, 0)
	e.quantize_to(80)
	assert_equal(0, e.time_from_start)

	e.time_from_start = 1
	e.quantize_to(80)
	assert_equal(0, e.time_from_start)

	e.time_from_start = 70
	e.quantize_to(80)
	assert_equal(80, e.time_from_start)

	e.time_from_start = 100
	e.quantize_to(80)
	assert_equal(80, e.time_from_start)

	e.time_from_start = 398
	e.quantize_to(80)
	assert_equal(400, e.time_from_start)

	e.time_from_start = 405
	e.quantize_to(80)
	assert_equal(400, e.time_from_start)

	e.time_from_start = 439
	e.quantize_to(80)
	assert_equal(400, e.time_from_start)

	e.time_from_start = 440
	e.quantize_to(80)
	assert_equal(480, e.time_from_start)

	e.time_from_start = 441
	e.quantize_to(80)
	assert_equal(480, e.time_from_start)
    end

end
