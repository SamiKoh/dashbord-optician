<template>
  <b-container>
    <b-row>
      <b-col cols="3">
        <b-card class="m-0 p-0" header="Menu">
          <!-- <h4>Personal options</h4> -->
          <b-list-group flush>
            <b-list-group-item style="cursor: pointer" @click="mode = 'cs'"
              >Select customer</b-list-group-item
            >
            <b-list-group-item style="cursor: not-allowed"
              >Create customer</b-list-group-item
            >
            <b-list-group-item style="cursor: not-allowed"
              >Messages
              <b-badge pill variant="danger">1</b-badge></b-list-group-item
            >
            <b-list-group-item style="cursor: not-allowed"
              >Calendar</b-list-group-item
            >
            <b-list-group-item style="cursor: not-allowed"
              >Help</b-list-group-item
            >
          </b-list-group>

          <!-- <div v-if="customerselection" style="margin-left: 50px">
            <b-list-group flush>
              <b-list-group-item>General information</b-list-group-item>
              <b-list-group-item>Payments</b-list-group-item>
              <b-list-group-item>Upload pictures</b-list-group-item>
              <b-list-group-item>Progress</b-list-group-item>
            </b-list-group>
          </div> -->
        </b-card>
        <b-card
          class="m-0 mt-2 p-0"
          header="Selected customer"
          v-if="mode != 'cs'"
        >
          <b-list-group flush>
            <b-list-group-item>
              <b>Name:</b> {{ customer.name }}
            </b-list-group-item>
            <b-list-group-item><b>Id:</b> {{ customer.id }}</b-list-group-item>

            <b-list-group flush>
              <b-list-group-item class="pointer" @click="mode = 'gi'"
                >General information</b-list-group-item
              >
              <b-list-group-item class="pointer" @click="mode = 'img'"
                >Upload images</b-list-group-item
              >
              <b-list-group-item style="cursor: not-allowed" class="pointer"
                >Payments</b-list-group-item
              >
              <b-list-group-item style="cursor: not-allowed" class="pointer"
                >Progress</b-list-group-item
              >
            </b-list-group>
          </b-list-group>
        </b-card>
      </b-col>
      <b-col cols="9">
        <b-card v-if="mode == 'img'">
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
            </b-row>

            <b-row class="mt-3">
              <b-col class="col-2"></b-col>
              <b-col><h3>Left Eye</h3></b-col>
              <b-col><h3>Right Eye</h3></b-col>
            </b-row>
            <b-row style="min-height: 300px">
              <b-col class="col-2"
                ><div class="align-middle">Fundusphoto</div></b-col
              >
              <b-col class="m-1"
                ><img
                  :src="`${publicPath}left-fundus.jpg`"
                  height="300px"
                  width="300px"
              /></b-col>
              <b-col class="m-1">
                <img
                  :src="`${publicPath}right-fundus.png`"
                  height="300px"
                  width="300px"
                />
              </b-col>
            </b-row>
            <b-row style="">
              <b-col class="col-2">Oct scan</b-col>
              <b-col class="img-drop m-1"
                ><b-form-file style=""></b-form-file
              ></b-col>
              <b-col class="img-drop m-1"
                ><b-form-file style=""></b-form-file
              ></b-col>
            </b-row>
            <b-row style="">
              <b-col class="col-2">Visualfield</b-col>
              <b-col class="img-drop m-1"
                ><b-form-file style=""></b-form-file
              ></b-col>
              <b-col class="img-drop m-1"
                ><b-form-file style=""></b-form-file
              ></b-col>
            </b-row>

            <b-form-row class="justify-content-center mt-4">
              <b-button variant="info" class="mr-3">Save</b-button>
              <b-button variant="success">Submit</b-button>
            </b-form-row>
          </b-form>
        </b-card>
        <b-card v-if="mode == 'cs'">
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
                @click="
                  mode = 'img';
                  selectCustomer(data);
                "
                class="pointer"
              >
                {{ data.value }}
              </div>
            </template>
          </b-table>
        </b-card>
        <customer-form :disabled="true" v-if="mode=='gi'"/>
      </b-col>
    </b-row>
  </b-container>
</template>


<script>
import CustomerForm from "@/views/Home.vue";

export default {
  components: { CustomerForm },
  data: () => ({
    uploaded: false,
    publicPath: process.env.BASE_URL,
    customerselection: "",
    mode: "cs",
    customers: [
      { name: "John Doe", date_of_birth: "4.6.1985", id: "38919" },
      { name: "Zula Rosenbaum", date_of_birth: "8.5.1989", id: "52952" },
    ],
  }),
  methods: {
    selectCustomer(data) {
      console.log(data);
      this.customerselection = data.item.id;
    },
  },
  computed: {
    customer() {
      let c = this.customers.find((c) => c.id == this.customerselection);
      console.log("searching customer with id ", this.customerselection, c);
      if (c) return c;
      else return this.customers[0];
    },
  },
};
</script>

<style lang="css">
.img-drop {
  /*  background-color: lightgray; */
}
</style>