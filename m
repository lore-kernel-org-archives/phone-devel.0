Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4786DCDB483
	for <phone-devel@archiver.kernel.org>; Sun, 15 Oct 2023 21:12:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbjJOVME (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 15 Oct 2023 17:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjJOVMD (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 15 Oct 2023 17:12:03 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B21BD9
        for <phone-devel@vger.kernel.org>; Sun, 15 Oct 2023 14:12:01 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so3546954f8f.2
        for <phone-devel@vger.kernel.org>; Sun, 15 Oct 2023 14:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697404319; x=1698009119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwtY6tuavqhephvZ/IgYYe/hWSZGS4BBH2edbm4GSnk=;
        b=kPT+E0uf4j2eX3RVpZZjo6cLMrT/BDyl/CZeqSqH1BuDCncNX6vscUEZ5jtEMIqSwX
         HEfAUzKOn/uGbbPFYJ6KDxDbIgdOwVBQ6MAktIe7hYF+c5fW9+KSO1AaZ9c6mFAsiIJ0
         vUHEtZ0G0on1mhJ+aF5JomF+F/2K0HJ4jx7jmygrMTxt3EPvoTo4Gxzt71B6DxmadroH
         qmVHboP2jAdpDAOmQhtlY/mzRIdy6wHJVWfQS06mvD6T3/osPOsHDYkUgA4Xt1NePzo7
         KAnGeoPuEbl8VzHaLTu3GwRfowXf2oL9oDF1WozicwL8YEZjwcUqzjk2Rr99xwcoV0M3
         bozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697404319; x=1698009119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwtY6tuavqhephvZ/IgYYe/hWSZGS4BBH2edbm4GSnk=;
        b=thPHoPDu9FZbUMhFRD8Zt4xlOatcC5w7B0ZbTDtLLkvchm7UpIo7KpzOd8gYYVqlea
         JKCIDhPY2n2UU5/WT1mimAFs8iDkVcRLl1QRBjzT9lAyphR4xRwwttWC+OGa+sN45eWE
         QqUuDTe+4dqml7gKIasWbzKP0IzwjjCVxu7W5b0CG70576drpt6BAux8bFH7ahv2am9i
         TNA60Nz4MmlaukNr5StQWwm9iEx9DS11Zv4mqt5pBvj92FSP8Mwlf2EgqMkEWYx1rLhs
         0+4VtYt1LbB8qyMoeKHjvxfoOKe9gq9r+P5UMJFm8XxX41SIxlg2fRSSplc5Q/VDuB6D
         4NRg==
X-Gm-Message-State: AOJu0YyQBNVlte13aV6IrdxUsD0DYzbE1Hxle/bP2H6zP72i53eDe1+s
        kSaDrsrDLMunBwrXLergbBE+aQ==
X-Google-Smtp-Source: AGHT+IHh3iTommnVZ/SRv1MxHgl7Wi01StwsKU+8qBOPmKCjkBX7ffpF9JSflchte2W1ztXignszaA==
X-Received: by 2002:adf:a34b:0:b0:32d:857c:d546 with SMTP id d11-20020adfa34b000000b0032d857cd546mr10994414wrb.64.1697404319736;
        Sun, 15 Oct 2023 14:11:59 -0700 (PDT)
Received: from lion.localdomain (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d4d11000000b0032d9548240fsm8456734wrt.82.2023.10.15.14.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 14:11:59 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Sun, 15 Oct 2023 22:11:49 +0100
Subject: [PATCH v2 1/7] dt-bindings: input: syna,rmi4: document
 syna,pdt-fallback-desc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-caleb-rmi4-quirks-v2-1-b227ac498d88@linaro.org>
References: <20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org>
In-Reply-To: <20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>
Cc:     methanal <baclofen@tuta.io>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb.connolly@linaro.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=1874;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=3p+nvUWlXAHPVkfrEPpEuMHDYaLsSCwDXEwLrUrxwrY=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhlSd0Lk/7wo/CTx0ouNRc/XMnnL1KRFJtp/qvZaw1d0xt
 /yhsP9LRykLgyAHg6yYIov4iWWWTWsv22tsX3ABZg4rE8gQBi5OAZjIpnSG/zH9PPP2lX2o+dv7
 hV3/5eO/sYfqNuyctk1KMTa0b6aiwjyGv4Ka9UlPpnuZ3PXvdPhx+3GNndND/ZsBZ4zW/nfi0g9
 /VwcA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This new property allows devices to specify some register values which
are missing on units with third party replacement displays. These
displays use unofficial touch ICs which only implement a subset of the
RMI4 specification.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/input/syna,rmi4.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
index 4d4e1a8e36be..1f4a2179e4d3 100644
--- a/Documentation/devicetree/bindings/input/syna,rmi4.yaml
+++ b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
@@ -49,6 +49,21 @@ properties:
     description:
       Delay to wait after powering on the device.
 
+  syna,pdt-fallback-desc:
+    $ref: /schemas/types.yaml#/definitions/uint8-matrix
+    description:
+      An array of pairs of function number and version. These are used
+      on some devices with replacement displays that use unofficial touch
+      controllers. These controllers do report the properties of their Page
+      Descriptor Table (PDT) entries, but leave the function_number and
+      function_version registers blank. These values should match exactly
+      the 5th and 4th bytes of each PDT entry from the original display's
+      touch controller.
+    items:
+      items:
+        - description: The 5th byte of the PDT entry
+        - description: The 4th byte of the PDT entry
+
   vdd-supply: true
   vio-supply: true
 

-- 
2.42.0

