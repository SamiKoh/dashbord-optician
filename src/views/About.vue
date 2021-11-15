<template>
  <b-container>
    <b-row>
      <b-col cols="3">
        <b-card class="m-0 p-0" header="Menu">
          <!-- <h4>Personal options</h4> -->
          <b-list-group flush>
            <b-list-group-item
              style="cursor: pointer"
              @click="customerselection = !customerselection"
              >Select customer</b-list-group-item
            >
            <b-list-group-item>Messages</b-list-group-item>
            <b-list-group-item>Calendar</b-list-group-item>
            <b-list-group-item>Help</b-list-group-item>
          </b-list-group>

          <div v-if="customerselection" style="margin-left: 50px">
            <b-list-group flush>
              <b-list-group-item>General information</b-list-group-item>
              <b-list-group-item>Payments</b-list-group-item>
              <b-list-group-item>Upload pictures</b-list-group-item>
              <b-list-group-item>Progress</b-list-group-item>
            </b-list-group>
          </div>
        </b-card>
      </b-col>
      <b-col cols="9">
        <b-card v-if="customerselection">
          <b-form>
            <b-row>
              <b-col
                ><h2>John Doe</h2>
                <h3>Date of birth: 4.6.1985</h3>

                Is the visual acuity 0.7 (6/9 or 20/30) or better on each eye?

                <b-form-checkbox-group>
                  <b-form-checkbox> Yes, without correction </b-form-checkbox>
                  <b-form-checkbox>
                    Yes, but only with correction
                  </b-form-checkbox>
                  <b-form-checkbox>No</b-form-checkbox>
                </b-form-checkbox-group>
                <b-form-group label="Correction amount">
                  <b-form-row>
                    <b-form-input
                      placeholder="Left eye"
                      class="col-6"
                    ></b-form-input>
                    <b-form-input
                      placeholder="Right eye"
                      class="col-6"
                    ></b-form-input>
                  </b-form-row>
                </b-form-group>
              </b-col>
              <b-col
                ><b-button variant="info" class="mr-3">Save</b-button>
                <b-button variant="success">Submit</b-button>
              </b-col>
            </b-row>

            <b-row class="mt-3">
              <b-col></b-col>
              <b-col><h3>Left Eye</h3></b-col>
              <b-col><h3>Right Eye</h3></b-col>
            </b-row>
            <b-row style="min-height: 300px">
              <b-col class=""
                ><div class="align-middle">Fundusphoto</div></b-col
              >
              <b-col class="m-1"
                ><img src="/left-fundus.png" height="300px" width="300px"
              /></b-col>
              <b-col class="m-1">
                <img src="/right-fundus.png" height="300px" width="300px" />
              </b-col>
            </b-row>
            <b-row style="">
              <b-col>Oct scan</b-col>
              <b-col class="img-drop m-1"> Drop image here </b-col>
              <b-col class="img-drop m-1"> Drop image here </b-col>
            </b-row>
            <b-row style="">
              <b-col>Visualfield</b-col>
              <b-col class="img-drop m-1"
                ><b-form-file style=""></b-form-file
              ></b-col>
              <b-col class="img-drop m-1"
                ><b-form-file  style=""></b-form-file
              ></b-col>
            </b-row>
          </b-form>
        </b-card>
        <b-card v-else>
          <b-card-title>Customer selection</b-card-title>

          <b-form-row class="mb-3">
            <b-form-input
              size="sm"
              class="col-6"
              placeholder="Search"
            ></b-form-input>
            <b-button size="sm" class="col-2 ml-2" type="submit"
              >Search</b-button
            >
          </b-form-row>

          <b-table :items="customers">
            <template #cell(name)="data">
              <div
                @click="customerselection = !customerselection"
                style="cursor: pointer"
              >
                {{ data.value }}
              </div>
            </template>
          </b-table>
        </b-card>
      </b-col>
    </b-row>
  </b-container>
</template>


<script>
export default {
  data: () => ({
    uploaded: false,
    customerselection: true,
    customers: [
      { name: "John Doe", date_of_birth: "4.6.1985", id: "38919" },
      { name: "Zula Rosenbaum", date_of_birth: "8.5.1989", id: "52952" },
    ],
  }),
};
</script>

<style lang="css">
.img-drop {
 /*  background-color: lightgray; */
}
</style>