import React from "react";
import { format as formatDate } from "date-fns";
import "./Utils.css";

export function Section({ className, list, ...props }) {
  const classes = ["Section", list && "Section--list", className]
    .filter(Boolean)
    .join(" ");
  return <section className={classes} {...props} />;
}

export function Required({ className, ...props }) {
  return (
    <span className={["Required", className].join(" ")} {...props}>
      &#42;
    </span>
  );
}

export function Button({ className, ...props }) {
  return <button className={["Button", className].join(" ")} {...props} />;
}

export function Input({ className, ...props }) {
  return <input className={["Input", className].join(" ")} {...props} />;
}

export function NumericFormFields({ className, ...props }) {
  const inputFields = [
    // 'tw_id',
    'new_tw_name',
    'density',
    'e_long',
    'e_cross',
    'velocity_sound_long',
    'radiation_ratio',
    'sample_length',
    'sample_width',
    'sample_thickness',
    'sample_weight_grams',
    'peak_hz_long_grain',
    'peak_hz_cross_grain',
    // 'comments'
  ];

  //should I just make this explicit in Submission form? Maybe have all numeric fields here
  return inputFields.map((field, key) => {
    return (
      <div className={field} key={key}>
        <label htmlFor={["SubmissionForm__", field].join("")}>
          {field}
        </label>
        <Input name={field} className={field} {...props}></Input>
      </div>
    );
  });
}
