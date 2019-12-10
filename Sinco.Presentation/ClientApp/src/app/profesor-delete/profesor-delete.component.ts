import { Component, OnInit } from "@angular/core";
import { FormBuilder, FormGroup } from "@angular/forms";
import { RegistroService } from "../registro/registro.service";
import { Router } from "@angular/router";
import { IProfesor } from "../profesor/profesor";

@Component({
  selector: "app-profesor-delete",
  templateUrl: "./profesor-delete.component.html",
  styleUrls: ["./profesor-delete.component.css"]
})
export class ProfesorDeleteComponent implements OnInit {

    constructor(private fb: FormBuilder,
      private registroService: RegistroService,
      private router: Router) {
    }

    formGroup: FormGroup;
    profesor: IProfesor[];

    ngOnInit() {
      this.formGroup = this.fb.group({
        id: null
      });

      this.registroService.getProfesores().subscribe(profesorWs => this.profesor = profesorWs,
        error => console.error(error),
        () => { console.log(this.profesor) });
    }

    save() {
        const idprofesor: number = Object.assign({}, this.formGroup.get("id").value);

        this.registroService.deleteProfesor(idprofesor).subscribe(idprofesor => this.onSaveSuccess(),
        error => console.error(error));
    }

    onSaveSuccess() {
      this.router.navigate(["/registro"]);
    }

}
