open Js_of_ocaml

let () =
  Js.Unsafe.global##.SanctaphraxLib :=
    object%js
      val professionalInvestorStatus =
        Js.wrap_callback
          Professional_investor_api_web.professional_investor_status
      val wellInformedInvestorStatus =
        Js.wrap_callback
          Professional_investor_api_web.well_informed_investor_status
    end
