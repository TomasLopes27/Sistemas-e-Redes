import { Component} from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatSelectModule } from '@angular/material/select';
import { MatInputModule } from '@angular/material/input'; // para o textarea

@Component({
  selector: 'app-report-dialog',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    MatDialogModule,
    MatButtonModule,
    MatFormFieldModule,
    MatSelectModule,
    MatInputModule
  ],
  templateUrl: './report-dialog.component.html',
})
export class ReportDialogComponent {
  reportDescription: string = '';
  selectedIssueType: string = '';

  issueTypes = [
    { value: 'inapropriado', label: 'Inapropriado' },
    { value: 'spam', label: 'Spam' },
    { value: 'conteudo_errado', label: 'Conteúdo Errado' },
    { value: 'outro', label: 'Outro' }
  ];

  constructor(public dialogRef: MatDialogRef<ReportDialogComponent>) {}

  onCancel() {
    this.dialogRef.close(false);
  }

  onSubmit() {
    this.dialogRef.close({
      description: this.reportDescription,
      issue_type: this.selectedIssueType
    });
  }
}
