<template>
  <b-container>
    <b-row>
      <b-col cols="3"
        ><b-card class="m-0 p-0" header="Menu">
          <!-- <h4>Personal options</h4> -->
          <b-list-group flush>
            <b-list-group-item>Personal information</b-list-group-item>
            <b-list-group-item style="cursor: pointer" @click="mode = 'cs'"
              >Select customer</b-list-group-item
            >
            <b-list-group-item>
              New customers
              <b-badge pill variant="info">3</b-badge>
            </b-list-group-item>
            <!-- <b-list-group-item>John Doe</b-list-group-item>
            <b-list-group-item>Jane Doe</b-list-group-item> -->
            <b-list-group-item
              >Messages
              <b-badge pill variant="danger">1</b-badge>
            </b-list-group-item>
            <b-list-group-item>Calendar</b-list-group-item>
            <b-list-group-item>Help</b-list-group-item>
          </b-list-group>
        </b-card>

        <b-card
          class="m-0 mt-2 p-0"
          header="Selected customer"
          v-if="mode != 'cs'"
        >
          <b-list-group flush>
            <b-list-group-item> <b>Name:</b> John Doe </b-list-group-item>
            <b-list-group-item><b>Id:</b> 38919</b-list-group-item>

            <b-list-group flush>
              <b-list-group-item style="cursor: pointer" @click="mode = 'gi'"
                >General information</b-list-group-item
              >
              <b-list-group-item style="cursor: pointer" @click="mode = 'img'"
                >Images</b-list-group-item
              >
              <b-list-group-item
                style="cursor: pointer"
                @click="mode = 'results'"
                >Results</b-list-group-item
              >
            </b-list-group>
          </b-list-group>
        </b-card>
      </b-col>
      <b-col cols="9">
        <Results v-if="mode == 'results'"> Testi</Results>

        <b-card
          class="mb-5"
          v-if="mode == 'img' || mode == 'gi'"
          :header="mode == 'img' ? 'Images' : 'General Information'"
        >
          <b-form>
            <b-row>
              <b-col
                ><h2>John Doe</h2>
                <h3>Date of birth: 4.6.1985</h3>
              </b-col>
              <b-col> </b-col>
            </b-row>

            <div v-if="mode == 'img'">
              <b-row class="mt-3">
                <b-col></b-col>
                <b-col><h3>Left Eye</h3></b-col>
                <b-col><h3>Right Eye</h3></b-col>
              </b-row>
              <b-row style="min-height: 300px">
                <b-col class=""
                  ><div class="align-middle">Fundusphoto</div>

                  <b-button>Review</b-button>
                </b-col>
                <b-col class="m-1"
                  ><img :src="`${publicPath}left-fundus.jpg`" height="300px" width="300px"
                /></b-col>
                <b-col class="m-1">
                  <img :src="`${publicPath}right-fundus.png`" height="300px" width="300px" />
                </b-col>
              </b-row>
              <b-row style="min-height: 300px">
                <b-col>Oct scan <b-button>Review</b-button></b-col>

                <b-col class="m-1"
                  ><img :src="`${publicPath}oct-left.png`" height="300px" width="300px" />
                </b-col>
                <b-col class="m-1"
                  ><img :src="`${publicPath}oct-right.png`" height="300px" width="300px" />
                </b-col>
              </b-row>
              <b-row style="min-height: 300px mb-3">
                <b-col>Visualfield <b-button>Review</b-button></b-col>
                <b-col class="m-1">
                  <img :src="`${publicPath}view-left.png`" height="300px" width="300px" />
                </b-col>
                <b-col class="m-1"
                  ><img :src="`${publicPath}view-right.png`" height="300px" width="300px"
                /></b-col>
              </b-row>
              <!-- <b-form-group label="Comments">
                <b-textarea></b-textarea>
              </b-form-group> -->

              <b-form-row class="mt-3 justify-content-center">
                <b-button variant="info" class="mr-3"
                  >Ask for more information</b-button
                >
                <b-button @click="mode = 'results'" variant="success"
                  >Go to results</b-button
                >
              </b-form-row>
            </div>
            <div v-else>
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
            </div>
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
              <div @click="mode = 'img'" style="cursor: pointer">
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
import Results from "@/components/Results.vue";
export default {
  components: { Results },
  data: () => ({
    uploaded: false,
    customerselection: "38919",
    images: false,
    publicPath:process.env.BASE_URL,
    mode: "cs",
    customers: [
      { name: "John Doe", date_of_birth: "4.6.1985", id: "38919" },
      { name: "Zula Rosenbaum", date_of_birth: "8.5.1989", id: "52952" },
      { name: "Mallie Koelpin", date_of_birth: "13.3.1973", id: "81141" },
    ],
  }),
  computed: {},
};
</script>