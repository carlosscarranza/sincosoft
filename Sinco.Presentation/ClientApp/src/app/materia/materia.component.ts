import { Component, OnInit } from "@angular/core";
import { FormBuilder, FormGroup } from "@angular/forms";
import { RegistroService } from "../registro/registro.service";
import { Router } from "@angular/router";
import { IProfesor } from "../profesor/profesor";
import { IMateria } from "./materia";


@Component({
  selector: "app-materia",
  templateUrl: "./materia.component.html",
  styleUrls: ["./materia.component.css"]
})
export class MateriaComponent implements OnInit {

    constructor(private fb: FormBuilder,
      private registroService: RegistroService,
      private router: Router) {
    }

    formGroup: FormGroup;
    profesor: IProfesor[];

    ngOnInit() {
      this.formGroup = this.fb.group({
        nombre: "",
        codigo: ""
      });

      this.registroService.getProfesores().subscribe(profesorWs => this.profesor = profesorWs,
        error => console.error(error),
        () => { console.log(this.profesor) });
    }

    save() {
      let materia: IMateria = Object.assign({}, this.formGroup.value);

        this.registroService.createMateria(materia).subscribe(materia => this.onSaveSuccess(),
        error => console.error(error));
    }

    onSaveSuccess() {
      this.router.navigate(["/registro"]);
    }
}
