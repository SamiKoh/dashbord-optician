<template>
  <b-card header="Results">
    <b-carousel
      id="carousel-1"
      v-model="slide"
      :interval="4000"
      controls
      indicators
      background="#ababab"
      img-width="1024"
      img-height="480"
      style="text-shadow: 1px 1px 2px #333"
      @sliding-start="onSlideStart"
      @sliding-end="onSlideEnd"
    >
      <b-carousel-slide caption="Fundusphoto">
        <template #img>
          <img src="/left-fundus.jpg" style="width:50%; height90%;" />
          <img src="/right-fundus.png" style="width:50%; height90%;" />
        </template>
      </b-carousel-slide>
      <b-carousel-slide caption="Oct scan">
        <template #img>
          <img src="/oct-left.png" style="width:50%; height90%;" />
          <img src="/oct-right.png" style="width:50%; height90%;" />
        </template>
      </b-carousel-slide>
      <b-carousel-slide caption="Visualfield">
        <template #img>
          <img src="/view-left.png" style="width:50%; height90%;" />
          <img src="/view-right.png" style="width:50%; height90%;" />
        </template>
      </b-carousel-slide>
    </b-carousel>
    <div class="mt-3"><b class="mt-3">Optician has filled</b></div>

    <b-form-group
      class="mt-3"
      label="Is the visual acuity 0.7 (6/9 or 20/30) or better on each eye?"
    >
      <b-form-radio disabled v-model="va" value="y">
        Yes, without correction
      </b-form-radio>
      <b-form-radio disabled v-model="va" value="y2">
        Yes, but only with correction <b>Left eye:</b> -1
        <b>Right eye</b> -1.25</b-form-radio
      >
      <b-form-radio disabled v-model="va" value="n"> No </b-form-radio>
    </b-form-group>
    <div class="mt-3"><b class="mt-3">Ophthalmologist fills</b></div>
    <b-form-group
      class="mt-3"
      label="Is there any evidence or history of impaired night vision?"
    >
      <b-form-radio v-model="nv" value="true"> Yes </b-form-radio>
      <b-form-radio v-model="nv" value="false"> No </b-form-radio>
    </b-form-group>
    <b-form-group class="mt-3" label="Is there any defect in colour vision?">
      <b-form-radio v-model="cv" value="true"> Yes </b-form-radio>
      <b-form-radio v-model="cv" value="false"> No </b-form-radio>
    </b-form-group>
    <b-form-group class="mt-3" label="Is there any sign of diplopia?">
      <b-form-radio v-model="dip" value="true"> Yes </b-form-radio>
      <b-form-radio v-model="dip" value="false"> No </b-form-radio>
    </b-form-group>
    <b-form-group
      class="mt-3"
      label="Are there any defects in the binocular visual field?"
    >
      <b-form-radio v-model="vfield" value="true"> Yes </b-form-radio>
      <b-form-radio v-model="vfield" value="false"> No </b-form-radio>
    </b-form-group>
    <b-form-group
      class="mt-3"
      label="Is there any evidence of other ophthalmic pathological conditions or diabetes?"
    >
      <b-form-radio v-model="patho" value="true"> Yes </b-form-radio>
      <b-form-radio v-model="patho" value="false"> No </b-form-radio>
    </b-form-group>
    <b>
      I, certify that I have examined the above named person, confirmed his/her
      identity and that I have correctly answered the questions above.
    </b>

    <b-form-row>
      <b-form-group class="col-6" label="Date of examination">
        <b-form-input v-model="today" type="date"></b-form-input>
      </b-form-group>
      <b-form-group class="col-6" label="Name">
        <b-form-input v-model="name" type="text"></b-form-input>
      </b-form-group>
    </b-form-row>

    <b-btn class="mr-3" variant="info">Cancel</b-btn>
    <b-btn variant="success">Submit</b-btn>
  </b-card>
</template>

<script>
export default {
  name: "Results",
  data() {
    return {
      slide: 0,
      sliding: null,
      patho: "",
      va: "y2",
      nv: "",
      cv: "",
      dip: "",
      vfield: "",
      today: "",
      name: "Dr. John Lowe",
    };
  },
  methods: {
    onSlideStart(slide) {
      this.sliding = true;
    },
    onSlideEnd(slide) {
      this.sliding = false;
    },
  },
  mounted: function () {
    this.today = new Date().toISOString().slice(0, 10);
  },
};
</script>