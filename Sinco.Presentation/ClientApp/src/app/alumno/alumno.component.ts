import { Component, OnInit, Input } from "@angular/core";
import { FormBuilder, FormGroup } from "@angular/forms";
import { IAlumno } from "./alumno";
import { RegistroService } from "../registro/registro.service";
import { Router } from "@angular/router";


@Component({
  selector: "app-alumno",
  templateUrl: "./alumno.component.html",
  styleUrls: ["./alumno.component.css"]
})
export class AlumnoComponent implements OnInit {

    constructor(private fb: FormBuilder,
      private registroService: RegistroService,
      private router: Router) {
    }

    formGroup: FormGroup;
    alum: IAlumno;

    @Input()
    editMode: boolean;

    @Input("Alumno")
    set alumno(alumno: IAlumno) {
      if (!(alumno === undefined)) {
        this.setStudent(alumno);
      }
    }

    ngOnInit() {
      this.formGroup = this.fb.group({
        nombre: "",
        semestre: null,
        carrera: ""
      });
    }

    save() {
      if (this.editMode) {
        //Actualizar el alumno
        const alumno: IAlumno = Object.assign({}, this.formGroup.value);
        alumno.id = this.alum.id;

        this.registroService.updateAlumno(alumno).subscribe(alumno => this.onSaveSuccess(),
          error => console.error(error));
      } else {
        //Crear el alumno
        const alumno: IAlumno = Object.assign({}, this.formGroup.value);

        this.registroService.createAlumno(alumno).subscribe(alumno => this.onSaveSuccess(),
          error => console.error(error));
      }
    }

    setStudent(alumno: IAlumno) {
      this.alum = alumno;
      this.formGroup = this.fb.group({
        nombre: alumno.nombre,
        semestre: alumno.semestre,
        carrera: alumno.carrera
      });
    }

    onSaveSuccess() {
      this.router.navigate(["/registro"]);
    }

}
