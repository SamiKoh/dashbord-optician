<template>
  <b-container class="home">
    <b-row>
      <b-col cols="12">
        <b-card class="mb-5" :header="disabled ? 'General Information':false">
          <h2 v-if="!disabled">Eyesight test form</h2>
          <b-form>
            <b-form-group
              label-for="firstname"
              class="label"
              label="First name"
            >
              <b-form-input
                id="firstname"
                :disabled="disabled"
                placeholder="Please type your first name"
              >
              </b-form-input>
            </b-form-group>

            <b-form-group class="label" label="Last name">
              <b-form-input
                :disabled="disabled"
                placeholder="Please type your last name"
              >
              </b-form-input>
            </b-form-group>

            <b-form-group class="label" label="Email Address">
              <b-form-input
                :disabled="disabled"
                placeholder="Please type your email address"
                type="email"
              >
              </b-form-input>
            </b-form-group>
            <b-form-group class="label" label="Phone number">
              <b-form-input
                :disabled="disabled"
                placeholder="Please type your phone number"
              >
              </b-form-input>
            </b-form-group>
            <b-form-group class="label" label="Address">
              <b-form-input
                :disabled="disabled"
                placeholder="Please type your name"
              >
              </b-form-input>
            </b-form-group>
            <b-form-group class="label" label="Postcode">
              <b-form-input
                :disabled="disabled"
                placeholder="Please type your postcode"
              >
              </b-form-input>
            </b-form-group>
            <b-form-group class="label" label="City">
              <b-form-input
                :disabled="disabled"
                placeholder="Please type your city"
              >
              </b-form-input>
            </b-form-group>
            <b-form-group class="label" label="State">
              <b-form-input
                :disabled="disabled"
                placeholder="Please type your state"
              >
              </b-form-input>
            </b-form-group>
            <b-form-group class="label" label="Date of birth">
              <b-form-input :disabled="disabled" type="date"> </b-form-input>
            </b-form-group>

            <b-form-group class="label" label="Lisence number">
              <b-form-input
                :disabled="disabled"
                placeholder="Please type your lisence number (if known)"
              >
              </b-form-input>
            </b-form-group>

            <b-form-group id="cb" class="label" label="Lisence class">
              <b-form-checkbox-group :disabled="disabled" v-model="checkbox">
                <b-form-checkbox value="A" id="checkbox-1"> A </b-form-checkbox>
                <b-form-checkbox value="B" id="checkbox-2"> B </b-form-checkbox>
                <b-form-checkbox value="C" id="checkbox-3"> C </b-form-checkbox>
                <b-form-checkbox value="D" id="checkbox-4"> D </b-form-checkbox>
                <b-form-checkbox value="E" id="checkbox-5"> E </b-form-checkbox>
                <b-form-checkbox value="F" id="checkbox-6"> F </b-form-checkbox>
              </b-form-checkbox-group>
              <b-form-input :disabled="disabled"
                class="mt-3"
                placeholder="Subclass information"
              ></b-form-input>
            </b-form-group>

            <b-list-group>
              <b-list-group-item>
                Are any of the following vision or eye conditions previously
                identified? If YES, please tick:

                <b-form-checkbox-group v-model="checkbox2" :disabled="disabled">
                  <b-form-checkbox value="diplopia" id="checkbox-7"> Diplopia </b-form-checkbox>
                  <b-form-checkbox value="monocular" id="checkbox-8">
                    Monocular Vision
                  </b-form-checkbox>
                  <b-form-checkbox value="visual" id="checkbox-9">
                    Visual Field Defec
                  </b-form-checkbox>
                  <b-form-checkbox value="retinitis" id="checkbox-10">
                    Retinitis Pigmentosa
                  </b-form-checkbox>
                </b-form-checkbox-group>
              </b-list-group-item>
            </b-list-group>
            <div class="mt-3 mb-3"></div>
            <b-button variant="success">Send</b-button>
            <b-button class="ml-3">Clear</b-button>
          </b-form>
        </b-card>
      </b-col>
    </b-row>
  </b-container>
</template>

<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  name: "Home",
  props: {
    disabled: {
      type: Boolean,
      default: false,
    },
  },
  data: () => ({
    checkbox: [],
    checkbox2: [],
  }),
});
</script>


<style scoped>
.form-group {
  text-align: left !important;
}
</style>