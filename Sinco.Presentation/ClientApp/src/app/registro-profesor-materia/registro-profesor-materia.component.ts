import { Component, OnInit } from "@angular/core";
import { FormBuilder, FormGroup } from "@angular/forms";
import { RegistroService } from "../registro/registro.service";
import { Router } from "@angular/router";
import { IProfesor } from "../profesor/profesor";
import { IMateria } from "../materia/materia";
import { IRegistroProfesorMateria } from "./registro-profesor-materia";

@Component({
  selector: "app-registro-profesor-materia",
  templateUrl: "./registro-profesor-materia.component.html",
  styleUrls: ["./registro-profesor-materia.component.css"]
})
export class RegistroProfesorMateriaComponent implements OnInit {

    constructor(private fb: FormBuilder,
      private registroService: RegistroService,
      private router: Router) {
    }

    formGroup: FormGroup;
    profesor: IProfesor[];
    materia: IMateria[];

    ngOnInit() {
      this.formGroup = this.fb.group({
        id_profesor: null,
        id_materia: null
      });

      this.registroService.getProfesores().subscribe(profesorWs => this.profesor = profesorWs,
        error => console.error(error),
        () => { console.log(this.profesor) });

      this.registroService.getMaterias().subscribe(materiaWs => this.materia = materiaWs,
        error => console.error(error),
        () => { console.log(this.materia) });
    }

    save() {
      const profesormateria: IRegistroProfesorMateria = Object.assign({}, this.formGroup.value);

      this.registroService.createProfesorMateria(profesormateria).subscribe(profesormateria => this.onSaveSuccess(),
        error => console.error(error));
    }

    onSaveSuccess() {
      this.router.navigate(["/registro"]);
    }

}
