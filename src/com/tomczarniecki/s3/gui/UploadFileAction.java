/*
 * Copyright (c) 2011, Thomas Czarniecki
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 *  * Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *  * Neither the name of S3DropBox, Thomas Czarniecki, tomczarniecki.com nor
 *    the names of its contributors may be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
package com.tomczarniecki.s3.gui;

import org.apache.commons.lang.ArrayUtils;

import javax.swing.AbstractAction;
import java.awt.event.ActionEvent;
import java.io.File;

import org.checkerframework.checker.guieffect.qual.*;
@UIType
public class UploadFileAction extends AbstractAction {

    private final UploadWorker uploader;
    private final Display display;
    private final Worker worker;

    public UploadFileAction(Display display, Worker worker, UploadWorker uploader) {
        super("Upload File");
        this.worker = worker;
        this.display = display;
        this.uploader = uploader;
    }

    public void actionPerformed(ActionEvent evt) {
        final File[] files = display.selectFiles("Select files or folders", "Upload");
        if (!ArrayUtils.isEmpty(files)) {
            worker.executeInBackground(new Runnable() {
                public void run() {
                    uploader.uploadFiles(files);
                }
            });
        }
    }
}
