import React from 'react';
import Layout from "@src/layout";
import "./success.scss";

const SuccessPage = () => {
    return(
        <Layout>
            <div className="container">
        <div className="row">
          <div className="col-6 my-4">
            <div className="p-4">
              <h2>It's official! Now, start preparing for your trip.</h2>
              <p>You have a confirmed reservation with "property.user.username". We've emailed your itinerary to "user.email"</p>
              <div className="my-5">
                <h6>Email your itinerary to anyone</h6>
                <input type="email" className="form-control w-75" placeholder="Email" />
                <div className="mt-4">
                  <button type="submit" className="email-itinerary-btn btn btn-primary mb-3">Submit</button>
                </div>
              </div>
            </div>
          </div>
          <div className="col-6 my-4 p-4">
            <div className="booking-border p-4">
              <div>
                <div className="property-image mb-3"/>
                    <h6>need to add an image url under this div that will serve as a backgroundImage,  insert this code as attribute next time style=backgroundImage: url property.image</h6>
                <div className="booking-box">
                  <h6><b>property.title</b></h6>
                  <p>property.property_type in property.city</p>
                </div>
                <div className="booking-box">
                  <p>"property.max_guests" guests</p>
                  <p>"start_date" - "end_date"</p>
                </div>
                <div className="booking-box">
                  <div className="d-flex justify-content-between">
                    <p>"property.price_per_night.00 x nights_booked" nights</p>
                    <p><b>"subtotal" 00</b></p>
                  </div>
                </div>
                <div className="booking-box d-flex justify-content-between">
                  <p><b>Total (USD)</b></p>
                  <p><b>"total".00</b></p>
                </div>
                <div className="my-3">
                  <p><b>Strict with grace period - free cancellation</b></p>
                  <p>Cancel within 48 hours of booking to get a full refund.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
        </Layout>
    )
}

export default SuccessPage;