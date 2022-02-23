<template>
  <div class="navBar">
    <ul>
      <li class="title">
        <NuxtLink :to="`/`">
          <h1>
            TV Series Club
          </h1>
        </NuxtLink>
      </li>
      <li><NuxtLink class="navLink" :to="`/`">Home</NuxtLink></li>
      <li><NuxtLink class="navLink" :to="`/about`">About</NuxtLink></li>
      <li>
        <!-- <div class="containerForSearch">
          <span>
            <input
              type='text'
              v-model="searchText"
              placeholder="Search for series..."
            />
          </span>
        </div> -->
      </li>
    </ul>

  </div>
  <slot />
</template>

<style>
.navBar{
  position: relative;
  top: 0;
  left: 0;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  height: 45px;
  background-color: #333;
}

li {
  float: left;
  height: 100%;
  margin-right: 10px;
}

li a {
  padding: 0px 15px 0px 15px;
  display: block;
  color: white;
  text-align: center;
  text-decoration: none;
  height: 100%;
  display: flex;
  align-items: center;
}

/* Change the link color to #111 (black) on hover */
.navLink:hover {
  background-color: #111;
}

.title {
  color: white;
  padding: 0px 10px 0px 10px;
  font-weight: bold;
  height: 100%;
  display: block;
  text-align: center;
  display: flex;
  align-items: center;
}

h1 {
  margin: 1px;
  cursor: pointer
}
</style>