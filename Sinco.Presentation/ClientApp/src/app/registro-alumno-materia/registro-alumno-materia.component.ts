import { Component, OnInit } from "@angular/core";
import { FormBuilder, FormGroup } from "@angular/forms";
import { RegistroService } from "../registro/registro.service";
import { Router } from "@angular/router";
import { IMateria } from "../materia/materia";
import { IAlumno } from "../alumno/alumno";
import { IRegistroAlumnoMateria } from "./registro-alumno-materia";

@Component({
  selector: "app-registro-alumno-materia",
  templateUrl: "./registro-alumno-materia.component.html",
  styleUrls: ["./registro-alumno-materia.component.css"]
})
export class RegistroAlumnoMateriaComponent implements OnInit {

    constructor(private fb: FormBuilder,
      private registroService: RegistroService,
      private router: Router) {
    }

    formGroup: FormGroup;
    materia: IMateria[];
    alumno: IAlumno[];

    ngOnInit() {
      this.formGroup = this.fb.group({
        id_materia: null,
        id_alumno: null
      });

      this.registroService.getMateriasRegistradas().subscribe(materiaWs => this.materia = materiaWs,
        error => console.error(error),
        () => { console.log(this.materia) });

      this.registroService.getAlumnos().subscribe(alumnoWs => this.alumno = alumnoWs,
        error => console.error(error),
        () => { console.log(this.alumno) });
    }

    save() {
      const alumnomateria: IRegistroAlumnoMateria = Object.assign({}, this.formGroup.value);

      this.registroService.createAlumnoMateria(alumnomateria).subscribe(alumnomateria => this.onSaveSuccess(),
        error => console.error(error));
    }

    onSaveSuccess() {
      this.router.navigate(["/registro"]);
    }
}
