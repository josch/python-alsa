# do some opaque struct typedefs to make const typedefs possible
cdef extern from "alsa/asoundlib.h":
	ctypedef struct snd_mixer_t
	ctypedef struct snd_mixer_class_t
	ctypedef struct snd_pcm_t
	ctypedef struct snd_mixer_elem_t
	ctypedef struct snd_mixer_selem_id_t

# define const ptr types as cython doesnt know const
cdef extern from *:
	ctypedef char* const_char_ptr "const char*"
	ctypedef snd_mixer_selem_id_t* const_snd_mixer_selem_id_t_ptr "const snd_mixer_selem_id_t *"
	ctypedef snd_mixer_elem_t* const_snd_mixer_elem_t_ptr "const snd_mixer_elem_t *"
	ctypedef snd_mixer_t* const_snd_mixer_t_ptr "const snd_mixer_t *"

cdef extern from "stdlib.h":
	ctypedef unsigned long size_t
	void *calloc(size_t count, size_t size)
	void *malloc(size_t size)
	void free(void *ptr)
	void *realloc(void *ptr, size_t size)

cdef extern from "alloca.h":
	void *alloca(size_t size)

cdef extern from "string.h":
	void *memset (void *s, int c, size_t n)

cdef extern from "sys/poll.h":
	struct pollfd:
		int fd
		short int events

cdef extern from "alsa/asoundlib.h":
	ctypedef enum snd_mixer_selem_regopt_abstract:
		pass
	ctypedef enum snd_mixer_elem_type_t:
		pass
	ctypedef enum snd_mixer_selem_channel_id_t: 
		pass
	struct snd_mixer_selem_regopt:
		pass
	ctypedef int (*snd_mixer_compare_t)(const_snd_mixer_elem_t_ptr e1, const_snd_mixer_elem_t_ptr e2)
	ctypedef int (*snd_mixer_callback_t)(snd_mixer_t *ctl, unsigned int mask, snd_mixer_elem_t *elem)
	ctypedef int (*snd_mixer_elem_callback_t)(snd_mixer_elem_t *elem, unsigned int mask)

	int snd_mixer_open(snd_mixer_t **mixer, int mode)
	int snd_mixer_close(snd_mixer_t *mixer)
	snd_mixer_elem_t *snd_mixer_first_elem(snd_mixer_t *mixer)
	snd_mixer_elem_t *snd_mixer_last_elem(snd_mixer_t *mixer)
	int snd_mixer_handle_events(snd_mixer_t *mixer)
	int snd_mixer_attach(snd_mixer_t *mixer, const_char_ptr name)
	int snd_mixer_detach(snd_mixer_t *mixer, const_char_ptr name)
	int snd_mixer_poll_descriptors_count(snd_mixer_t *mixer)
	int snd_mixer_poll_descriptors(snd_mixer_t *mixer, pollfd *pfds, unsigned int space)
	int snd_mixer_poll_descriptors_revents(snd_mixer_t *mixer, pollfd *pfds, unsigned int nfds, unsigned short *revents)
	int snd_mixer_load(snd_mixer_t *mixer)
	void snd_mixer_free(snd_mixer_t *mixer)
	int snd_mixer_wait(snd_mixer_t *mixer, int timeout)
	int snd_mixer_set_compare(snd_mixer_t *mixer, snd_mixer_compare_t msort)
	void snd_mixer_set_callback(snd_mixer_t *obj, snd_mixer_callback_t val)
	void * snd_mixer_get_callback_private(const_snd_mixer_t_ptr obj)
	void snd_mixer_set_callback_private(snd_mixer_t *obj, void * val)
	unsigned int snd_mixer_get_count(const_snd_mixer_t_ptr obj)
	int snd_mixer_class_unregister(snd_mixer_class_t *clss)

	snd_mixer_elem_t *snd_mixer_elem_next(snd_mixer_elem_t *elem)
	snd_mixer_elem_t *snd_mixer_elem_prev(snd_mixer_elem_t *elem)
	void snd_mixer_elem_set_callback(snd_mixer_elem_t *obj, snd_mixer_elem_callback_t val)
	void * snd_mixer_elem_get_callback_private(const_snd_mixer_elem_t_ptr obj)
	void snd_mixer_elem_set_callback_private(snd_mixer_elem_t *obj, void * val)
	snd_mixer_elem_type_t snd_mixer_elem_get_type(const_snd_mixer_elem_t_ptr obj)

	int snd_mixer_selem_register(snd_mixer_t *mixer, snd_mixer_selem_regopt *options, snd_mixer_class_t **classp)
	void snd_mixer_selem_get_id(snd_mixer_elem_t *element, snd_mixer_selem_id_t *id)
	const_char_ptr snd_mixer_selem_get_name(snd_mixer_elem_t *elem)
	unsigned int snd_mixer_selem_get_index(snd_mixer_elem_t *elem)
	snd_mixer_elem_t *snd_mixer_find_selem(snd_mixer_t *mixer, const_snd_mixer_selem_id_t_ptr id)

	int snd_mixer_selem_is_active(snd_mixer_elem_t *elem)
	int snd_mixer_selem_is_playback_mono(snd_mixer_elem_t *elem)
	int snd_mixer_selem_has_playback_channel(snd_mixer_elem_t *obj, snd_mixer_selem_channel_id_t channel)
	int snd_mixer_selem_is_capture_mono(snd_mixer_elem_t *elem)
	int snd_mixer_selem_has_capture_channel(snd_mixer_elem_t *obj, snd_mixer_selem_channel_id_t channel)
	int snd_mixer_selem_get_capture_group(snd_mixer_elem_t *elem)
	int snd_mixer_selem_has_common_volume(snd_mixer_elem_t *elem)
	int snd_mixer_selem_has_playback_volume(snd_mixer_elem_t *elem)
	int snd_mixer_selem_has_playback_volume_joined(snd_mixer_elem_t *elem)
	int snd_mixer_selem_has_capture_volume(snd_mixer_elem_t *elem)
	int snd_mixer_selem_has_capture_volume_joined(snd_mixer_elem_t *elem)
	int snd_mixer_selem_has_common_switch(snd_mixer_elem_t *elem)
	int snd_mixer_selem_has_playback_switch(snd_mixer_elem_t *elem)
	int snd_mixer_selem_has_playback_switch_joined(snd_mixer_elem_t *elem)
	int snd_mixer_selem_has_capture_switch(snd_mixer_elem_t *elem)
	int snd_mixer_selem_has_capture_switch_joined(snd_mixer_elem_t *elem)
	int snd_mixer_selem_has_capture_switch_exclusive(snd_mixer_elem_t *elem)

	int snd_mixer_selem_ask_playback_vol_dB(snd_mixer_elem_t *elem, long value, long *dBvalue)
	int snd_mixer_selem_ask_capture_vol_dB(snd_mixer_elem_t *elem, long value, long *dBvalue)
	int snd_mixer_selem_ask_playback_dB_vol(snd_mixer_elem_t *elem, long dBvalue, int dir, long *value)
	int snd_mixer_selem_ask_capture_dB_vol(snd_mixer_elem_t *elem, long dBvalue, int dir, long *value)
	int snd_mixer_selem_get_playback_volume(snd_mixer_elem_t *elem, snd_mixer_selem_channel_id_t channel, long *value)
	int snd_mixer_selem_get_capture_volume(snd_mixer_elem_t *elem, snd_mixer_selem_channel_id_t channel, long *value)
	int snd_mixer_selem_get_playback_dB(snd_mixer_elem_t *elem, snd_mixer_selem_channel_id_t channel, long *value)
	int snd_mixer_selem_get_capture_dB(snd_mixer_elem_t *elem, snd_mixer_selem_channel_id_t channel, long *value)
	int snd_mixer_selem_get_playback_switch(snd_mixer_elem_t *elem, snd_mixer_selem_channel_id_t channel, int *value)
	int snd_mixer_selem_get_capture_switch(snd_mixer_elem_t *elem, snd_mixer_selem_channel_id_t channel, int *value)
	int snd_mixer_selem_set_playback_volume(snd_mixer_elem_t *elem, snd_mixer_selem_channel_id_t channel, long value)
	int snd_mixer_selem_set_capture_volume(snd_mixer_elem_t *elem, snd_mixer_selem_channel_id_t channel, long value)
	int snd_mixer_selem_set_playback_dB(snd_mixer_elem_t *elem, snd_mixer_selem_channel_id_t channel, long value, int dir)
	int snd_mixer_selem_set_capture_dB(snd_mixer_elem_t *elem, snd_mixer_selem_channel_id_t channel, long value, int dir)
	int snd_mixer_selem_set_playback_volume_all(snd_mixer_elem_t *elem, long value)
	int snd_mixer_selem_set_capture_volume_all(snd_mixer_elem_t *elem, long value)
	int snd_mixer_selem_set_playback_dB_all(snd_mixer_elem_t *elem, long value, int dir)
	int snd_mixer_selem_set_capture_dB_all(snd_mixer_elem_t *elem, long value, int dir)
	int snd_mixer_selem_set_playback_switch(snd_mixer_elem_t *elem, snd_mixer_selem_channel_id_t channel, int value)
	int snd_mixer_selem_set_capture_switch(snd_mixer_elem_t *elem, snd_mixer_selem_channel_id_t channel, int value)
	int snd_mixer_selem_set_playback_switch_all(snd_mixer_elem_t *elem, int value)
	int snd_mixer_selem_set_capture_switch_all(snd_mixer_elem_t *elem, int value)
	int snd_mixer_selem_get_playback_volume_range(snd_mixer_elem_t *elem, long *min, long *max)
	int snd_mixer_selem_get_playback_dB_range(snd_mixer_elem_t *elem, long *min, long *max)
	int snd_mixer_selem_set_playback_volume_range(snd_mixer_elem_t *elem, long min, long max)
	int snd_mixer_selem_get_capture_volume_range(snd_mixer_elem_t *elem, long *min, long *max)
	int snd_mixer_selem_get_capture_dB_range(snd_mixer_elem_t *elem, long *min, long *max)
	int snd_mixer_selem_set_capture_volume_range(snd_mixer_elem_t *elem, long min, long max)

	int snd_mixer_selem_is_enumerated(snd_mixer_elem_t *elem)
	int snd_mixer_selem_is_enum_playback(snd_mixer_elem_t *elem)
	int snd_mixer_selem_is_enum_capture(snd_mixer_elem_t *elem)
	int snd_mixer_selem_get_enum_items(snd_mixer_elem_t *elem)
	int snd_mixer_selem_get_enum_item_name(snd_mixer_elem_t *elem, unsigned int idx, size_t maxlen, char *str)
	int snd_mixer_selem_get_enum_item(snd_mixer_elem_t *elem, snd_mixer_selem_channel_id_t channel, unsigned int *idxp)
	int snd_mixer_selem_set_enum_item(snd_mixer_elem_t *elem, snd_mixer_selem_channel_id_t channel, unsigned int idx)

	size_t snd_mixer_selem_id_sizeof()
	int snd_mixer_selem_id_malloc(snd_mixer_selem_id_t **ptr)
	void snd_mixer_selem_id_free(snd_mixer_selem_id_t *obj)
	void snd_mixer_selem_id_copy(snd_mixer_selem_id_t *dst, const_snd_mixer_selem_id_t_ptr src)
	const_char_ptr snd_mixer_selem_id_get_name(const_snd_mixer_selem_id_t_ptr obj)
	unsigned int snd_mixer_selem_id_get_index(const_snd_mixer_selem_id_t_ptr obj)
	void snd_mixer_selem_id_set_name(snd_mixer_selem_id_t *obj, const_char_ptr val)
	void snd_mixer_selem_id_set_index(snd_mixer_selem_id_t *obj, unsigned int val)

cdef struct selem:
	snd_mixer_elem_t *elem
	selem *next

SANE_CONTROL_COUNT = 16 # assuming a sane value of 16 controls

def rel_to_abs(min, max, value):
	return int(value*(max-min)+min)

def abs_to_rel(min, max, value):
	return float((value-min))/(max-min)

cdef class Mixer:
	cdef snd_mixer_t *handle
	cdef snd_mixer_elem_t **selems
	_elements = dict()
	def __init__(self, card="hw:0"):
		cdef int selem_count = 0, selems_size = SANE_CONTROL_COUNT
		cdef snd_mixer_elem_t *temp_elem
		cdef snd_mixer_elem_t **temp_elems
		cdef char name[32]
		cdef int enum_items_count, value
		cdef int err
		cdef long pmin, pmax, cmin, cmax

		err = snd_mixer_open(&self.handle, 0)
		if err < 0: return
		err = snd_mixer_attach(self.handle, card)
		if err < 0: return
		err = snd_mixer_selem_register(self.handle, NULL, NULL)
		if err < 0: return
		err = snd_mixer_load(self.handle)
		if err < 0: return

		self.selems = <snd_mixer_elem_t **>malloc(selems_size*sizeof(snd_mixer_elem_t *))
		
		temp_elem = snd_mixer_first_elem(self.handle)
		while temp_elem:
			selem_count += 1
			if selem_count > selems_size:
				# running out of space - realloc double the size
				selems_size *= 2
				temp_elems = <snd_mixer_elem_t **>realloc(self.selems, selems_size*sizeof(snd_mixer_elem_t *))
				if not temp_elems:
					raise MemoryError
					return
				self.selems = temp_elems
			self.selems[selem_count-1] = temp_elem
			
			enumeration = None
			if snd_mixer_selem_is_enumerated(temp_elem):
				enumeration = list()
				enum_items_count = snd_mixer_selem_get_enum_items(temp_elem)
				for i from 0 <= i < enum_items_count:
					snd_mixer_selem_get_enum_item_name(temp_elem, i, sizeof(name)-1, name)
					enumeration.append(name)
			
			playback_volume = None
			if snd_mixer_selem_has_playback_volume(temp_elem):
				snd_mixer_selem_get_playback_volume_range(temp_elem, &pmin, &pmax)
				playback_volume = (pmin, pmax)
			playback_switch = None
			if snd_mixer_selem_has_playback_switch(temp_elem):
				playback_switch = True
			capture_volume = None
			if snd_mixer_selem_has_capture_volume(temp_elem):
				snd_mixer_selem_get_capture_volume_range(temp_elem, &cmin, &cmax)
				capture_volume = (cmin, cmax)
			capture_switch = None
			if snd_mixer_selem_has_capture_switch(temp_elem):
				capture_switch = True

			self._elements[snd_mixer_selem_get_name(temp_elem)] = {
				"index": selem_count-1,
				"enumeration": enumeration,
				"playback_volume": playback_volume,
				"playback_switch": playback_switch,
				"capture_volume": capture_volume,
				"capture_switch": capture_switch
			}
			temp_elem = snd_mixer_elem_next(temp_elem)
		# shrink allocated memory to exact needed size
		self.selems = <snd_mixer_elem_t **>realloc(self.selems, selem_count*sizeof(snd_mixer_elem_t *))
		
	def get_enum_items(self, elem):
		if elem not in self._elements:
			raise KeyError("not a valid control", elem)
		
		return self._elements[elem]["enumeration"]
		
	def get_enum_item(self, elem):
		cdef unsigned int idx
		cdef snd_mixer_elem_t * selem
		
		if elem not in self._elements:
			raise KeyError("not a valid control", elem)
		
		elem = self._elements[elem]
		if elem["enumeration"] is None:
			return
		
		selem = self.selems[elem["index"]]
		snd_mixer_selem_get_enum_item(selem, <snd_mixer_selem_channel_id_t>0, &idx)
		return elem["enumeration"][idx]

	def set_enum_item(self, elem, value):
		cdef unsigned int idx
		cdef snd_mixer_elem_t * selem
		
		if elem not in self._elements:
			raise KeyError("not a valid control", elem)
		
		elem = self._elements[elem]
		if elem["enumeration"] is None:
			return

		if value not in elem["enumeration"]:
			if value < len(elem["enumeration"]):
				idx = value
			else:
				raise KeyError("not a valid enumeration item", value)
		else:
			idx = elem["enumeration"].index(value)
		
		selem = self.selems[elem["index"]]
		snd_mixer_selem_set_enum_item(selem, <snd_mixer_selem_channel_id_t>0, idx)
	
	def get_playback_volume(self, elem):
		cdef long ival
		cdef snd_mixer_elem_t * selem
		
		if elem not in self._elements:
			raise KeyError("not a valid control", elem)
		
		elem = self._elements[elem]
		if elem["playback_volume"] is None:
			return
		
		min, max = elem["playback_volume"]
		selem = self.selems[elem["index"]]
		snd_mixer_selem_get_playback_volume(selem, <snd_mixer_selem_channel_id_t>0, &ival)
		return abs_to_rel(min, max, ival)

	def set_playback_volume(self, elem, value):
		cdef snd_mixer_elem_t * selem
		
		if elem not in self._elements:
			raise KeyError("not a valid control", elem)
		
		if value < 0 or value > 1:
			raise ValueError("value out of range [0..1]", value)
		
		elem = self._elements[elem]
		if elem["playback_volume"] is None:
			return
		
		min, max = elem["playback_volume"]
		selem = self.selems[elem["index"]]
		ival = rel_to_abs(min, max, value)
		snd_mixer_selem_set_playback_volume_all(selem, ival)
	
	def get_capture_volume(self, elem):
		cdef long ival
		cdef snd_mixer_elem_t * selem
		
		if elem not in self._elements:
			raise KeyError("not a valid control", elem)
		
		elem = self._elements[elem]
		if elem["capture_volume"] is None:
			return
		
		min, max = elem["capture_volume"]
		selem = self.selems[elem["index"]]
		snd_mixer_selem_get_capture_volume(selem, <snd_mixer_selem_channel_id_t>0, &ival)
		return abs_to_rel(min, max, ival)
	
	def set_capture_volume(self, elem, value):
		cdef snd_mixer_elem_t * selem
		
		if elem not in self._elements:
			raise KeyError("not a valid control", elem)
		
		if value < 0 or value > 1:
			raise ValueError("value out of range [0..1]", value)
		
		elem = self._elements[elem]
		if elem["capture_volume"] is None:
			return
		
		min, max = elem["capture_volume"]
		selem = self.selems[elem["index"]]
		ival = rel_to_abs(min, max, value)
		snd_mixer_selem_set_capture_volume_all(selem, ival)
	
	def get_playback_switch(self, elem):
		cdef int value
		cdef snd_mixer_elem_t * selem

		if elem not in self._elements:
			raise KeyError("not a valid control", elem)
		
		elem = self._elements[elem]
		if elem["playback_switch"] is None:
			return
		
		selem = self.selems[elem["index"]]
		snd_mixer_selem_get_playback_switch(selem, <snd_mixer_selem_channel_id_t>0, &value)
		return bool(value)
	
	def set_playback_switch(self, elem, value):
		cdef snd_mixer_elem_t * selem
		
		if elem not in self._elements:
			raise KeyError("not a valid control", elem)
		
		elem = self._elements[elem]
		if elem["playback_switch"] is None:
			return
		
		selem = self.selems[elem["index"]]
		value = int(bool(value))
		snd_mixer_selem_set_playback_switch_all(selem, value)

	def get_capture_switeh(self, elem):
		cdef int value
		cdef snd_mixer_elem_t * selem
		
		if elem not in self._elements:
			raise KeyError("not a valid control", elem)

		elem = self._elements[elem]
		if elem["capture_switch"] is None:
			return
		
		selem = self.selems[elem["index"]]
		snd_mixer_selem_get_capture_switch(selem, <snd_mixer_selem_channel_id_t>0, &value)
		return bool(value)
	
	def set_capture_switch(self, elem, value):
		cdef snd_mixer_elem_t * selem
		
		if elem not in self._elements:
			raise KeyError("not a valid control", elem)

		elem = self._elements[elem]
		if elem["capture_switch"] is None:
			return
		
		selem = self.selems[elem["index"]]
		value = int(bool(value))
		snd_mixer_selem_set_capture_switch_all(selem, value)
	
	def __del__(self):
		#never called
		snd_mixer_close(self.handle)
