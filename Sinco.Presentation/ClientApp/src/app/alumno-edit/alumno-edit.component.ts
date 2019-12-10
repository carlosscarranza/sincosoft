import { Component, OnInit } from "@angular/core";
import { FormBuilder } from "@angular/forms";
import { RegistroService } from "../registro/registro.service";
import { Router } from "@angular/router";
import { IAlumno } from "../alumno/alumno";


@Component({
  selector: "app-alumno-edit",
  templateUrl: "./alumno-edit.component.html",
  styleUrls: ["./alumno-edit.component.css"]
})
export class AlumnoEditComponent implements OnInit {

    alumnos: IAlumno[];
    alumno: IAlumno;

    constructor(private fb: FormBuilder,
      private registroService: RegistroService,
      private router: Router) {
    }

    ngOnInit() {
        this.registroService.getAlumnos().subscribe(alumnoWs => this.alumnos = alumnoWs,
        error => console.error(error),
            () => { console.log(this.alumnos) });
    }

    onOptionsSelected(event) {
        this.registroService.getAlumno(event.target.value).subscribe(alumnoWs => this.alumno = alumnoWs,
          error => console.error(error),
            () => { console.log(this.alumno) });
    }
}
