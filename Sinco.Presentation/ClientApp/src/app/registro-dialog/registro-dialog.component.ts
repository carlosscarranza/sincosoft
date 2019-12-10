import { Component, OnInit, Inject } from "@angular/core";
import { MatDialogRef, MAT_DIALOG_DATA } from "@angular/material/dialog";
import { RegistroService } from "../registro/registro.service";
import { FormGroup, FormBuilder } from "@angular/forms";
import { IDetalleRegistro } from "./detalle-registro";
import { Router } from "@angular/router";

@Component({
  selector: "app-registro-dialog",
  templateUrl: "./registro-dialog.component.html",
  styleUrls: ["./registro-dialog.component.css"]
})
export class RegistroDialogComponent implements OnInit {

    constructor(
      private fb: FormBuilder,
      private registroService: RegistroService,
      private router: Router,
      public dialogRef: MatDialogRef<RegistroDialogComponent>,
      @Inject(MAT_DIALOG_DATA) public data: number) {
    }

    formGroup: FormGroup;

    ngOnInit() {
      this.formGroup = this.fb.group({
        periodo: null,
        nota: null,
        id_re_alumno_materia: null
      });
    }

    save() {
      //Actualizar el detalle
      const detregistro: IDetalleRegistro = Object.assign({}, this.formGroup.value);
      detregistro.id_re_alumno_materia = this.data["registroId"];

      this.registroService.updateDetalleRegistro(detregistro).subscribe(materia => this.onSaveSuccess(),
          error => console.log(error),
          () => this.onSaveSuccess());

        this.onNoClick();
    }

    onNoClick(): void {
        this.dialogRef.close();
    }

    onSaveSuccess() {
      this.router.navigate(["/registro"]);
    }
}
