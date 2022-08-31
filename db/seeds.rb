# User can be created from the Front end using sign up form or like below
User.create(username: "john doe", email: "jod@test.com", password: "123456")
User.create(username: "jane doe", email: "jad@test.com", password: "123456")

# Doctor
Doctor.create(
  name: "Dr. Jane Smith", 
  detail: "A doctor is responsible for all sides of care of a patient. They diagnose, educate, and treat patients to ensure that they have the best possible care. A few of the main duties of a doctor are performing diagnostic tests, recommending specialists for patients, document patient's medical history, and educating patients.",
  photo: "https://cdn.pixabay.com/photo/2017/03/14/03/20/woman-2141808_960_720.jpg",
  city: "New York",
  specialization: "Ophthalmologist", 
  fee: 100.00
)
Doctor.create(
  name: "Dr. David Whitmore", 
  detail: "A doctor is responsible for all sides of care of a patient. They diagnose, educate, and treat patients to ensure that they have the best possible care. A few of the main duties of a doctor are performing diagnostic tests, recommending specialists for patients, document patient's medical history, and educating patients.",
  photo: "https://cdn.pixabay.com/photo/2016/02/08/23/36/isolated-1188036_960_720.png",
  city: "Toronto",
  specialization: "Surgeon", 
  fee: 100.00
)
Doctor.create(
  name: "Dr. Priscilla McGill",
  detail: "A doctor is responsible for all sides of care of a patient. They diagnose, educate, and treat patients to ensure that they have the best possible care. A few of the main duties of a doctor are performing diagnostic tests, recommending specialists for patients, document patient's medical history, and educating patients.",
  photo: "https://cdn.pixabay.com/photo/2021/09/08/22/19/doctor-6608006_960_720.jpg",
  city: "London",
  specialization: "Gynecologist", 
  fee: 100.00
)

# Reservation can be created from the Front end using reservation form or like below
Reservation.create(
  city: "Imphal",
  date: "23/8/2022",
  user_id: 1,
  doctor_id: 1
)