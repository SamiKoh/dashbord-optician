<template>
  <b-container class="home">


    <b-row>
      <!--  <b-col cols="4">
        <b-card> </b-card>
        Left
      </b-col> -->
      <b-col cols="12">
        <b-card>
          <h2>Eyesight test form</h2>
          <b-form>
            <b-form-group label="First name">
              <b-form-input placeholder="Please type your first name">
              </b-form-input>
            </b-form-group>

            <b-form-group label="Last name">
              <b-form-input placeholder="Please type your last name">
              </b-form-input>
            </b-form-group>

            <b-form-group label="Email Address">
              <b-form-input placeholder="Please type your email address" type="email">
              </b-form-input>
            </b-form-group>
            <b-form-group label="Phone number">
              <b-form-input placeholder="Please type your phone number" >
              </b-form-input>
            </b-form-group>
            <b-form-group label="Address">
              <b-form-input placeholder="Please type your name"> </b-form-input>
            </b-form-group>
            <b-form-group label="Postcode">
              <b-form-input placeholder="Please type your postcode">
              </b-form-input>
            </b-form-group>
            <b-form-group label="City">
              <b-form-input placeholder="Please type your city">
              </b-form-input>
            </b-form-group>
            <b-form-group label="State">
              <b-form-input placeholder="Please type your state">
              </b-form-input>
            </b-form-group>
            <b-form-group label="Date of birth">
              <b-form-input type="date"> </b-form-input>
            </b-form-group>

            <b-form-group label="Lisence number">
              <b-form-input
                placeholder="Please type your lisence number (if known)"
              >
              </b-form-input>
            </b-form-group>

            <b-form-group label="Lisence class">
              <b-form-checkbox-group>
                <b-form-checkbox id="checkbox-1"> A </b-form-checkbox>
                <b-form-checkbox id="checkbox-1"> B </b-form-checkbox>
                <b-form-checkbox id="checkbox-1"> C </b-form-checkbox>
                <b-form-checkbox id="checkbox-1"> D </b-form-checkbox>
                <b-form-checkbox id="checkbox-1"> E </b-form-checkbox>
                <b-form-checkbox id="checkbox-1"> F </b-form-checkbox>
              </b-form-checkbox-group>
              <b-form-input placeholder="Subclass information"></b-form-input>
            </b-form-group>

            <b-list-group>
              <b-list-group-item>
                Are any of the following vision or eye conditions previously
                identified? If YES, please tick:

                <b-form-checkbox-group>
                  <b-form-checkbox id="checkbox-1"> Diplopia </b-form-checkbox>
                  <b-form-checkbox id="checkbox-1">
                    Monocular Vision
                  </b-form-checkbox>
                  <b-form-checkbox id="checkbox-1">
                    Visual Field Defec
                  </b-form-checkbox>
                  <b-form-checkbox id="checkbox-1">
                    Retinitis Pigmentosa
                  </b-form-checkbox>
                </b-form-checkbox-group>
              </b-list-group-item>
            </b-list-group>

            
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
  components: {},
  data: () => ({}),
});
</script>
