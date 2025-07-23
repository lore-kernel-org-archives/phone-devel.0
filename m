Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1422F270A
	for <phone-devel@vger.kernel.org>; Wed, 23 Jul 2025 14:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753279452; cv=none; b=oT7/1n6yy6r8yGGKjvDuLFKVM5B7Vldct6b4XAXs6oTWy40F7c7vzX/KNmcWm14ct21tVdWLtz+xXO1r1EwXYMwgr9ubDouJFcaYaDicVlHLy8DbHTfWqZchLf5Gnghr69l6BWqX2QnydN8kY4wGCqHCwDRa5F4nnzjYzQwSPKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753279452; c=relaxed/simple;
	bh=iFrv0UOBrWQDOMIVYCVEkyIJ0o38UILWsfNE6sREkpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E6OLHXMg4fLXU0XQDdEYj80wqUi+GYDH16ylBCpZxDq4ns45C00ebTLXh2Ibl6ymaRcHusl+stJL1x86lB9dXzcJGhcn8xYkW2K6IS+Dn0HC8wgGBJs0map4HDGv0/Yby0Y5m1XZYdS+Hm1ql63Jdd+TpVZaXtUFpHt2nIVTkp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=G+hMqo/v; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="G+hMqo/v"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60c4521ae2cso11544101a12.0
        for <phone-devel@vger.kernel.org>; Wed, 23 Jul 2025 07:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753279448; x=1753884248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIayvnL52YWH7X/Cr5CMXwZtJGZyuDUcKNZ3PxwKQms=;
        b=G+hMqo/vNEw56CMZ2SofiexvS8vVbsxq+zeSEnAWJFNJK4+tVGgJoAZuOy/t9EOjNv
         6D6cdLkm8tes110bKGEuoLyFhbeWRPVzDwKV+ubTf8JT29smqb6LjDXhtixgo1fPtcrc
         TZCk7hZTdvrRMJPBAFOI4+jZjFiJT3NxG6NnuxulPeDAkjpsRADqJw/rTVyklPq2dwYC
         ZGIwoi4UNcVY1nJm0180ZBoKj1t3EsFOtA1mWl7ztghaBK+PHG1WE/SDmiZ+ehv1ADE7
         ZcaytxTrSsd8NAyV1w5fwotJByOyjqLfJTA7BrrIrOANIC/jKOxV47CCt10Whwy12mju
         FwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753279448; x=1753884248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIayvnL52YWH7X/Cr5CMXwZtJGZyuDUcKNZ3PxwKQms=;
        b=CR3UHnsOpKNdFSe/CJjAHZYfg3DQJtf19jCyStE/Iq1x14PwgIfFyKF+4T+/rXO//b
         aaTPS0boSlzY4Fc5rCORbo8iRyio6IBBEN8RjP7udOwqVOZKzwPvXeeAJLqcJUHq2KuB
         MxLYex4IN+yvazAIn27ezjv9m1VtBamUEPVDSIfeLOVr+2xsbD+yF0ehgx0bxSz7ha97
         QLPpfGBvhZZ5R6jl3bqAOhEYoyAuB+jG9OoiwhopBHni0xDbNr6RApPOW3hUmnXJSXgY
         aUAUqYApRUWTZFnfkLXE8GPyOhB8TciazN6Gka1kg+H+hcW9Jl7T2whZtj24JVzFhFL4
         bL9w==
X-Forwarded-Encrypted: i=1; AJvYcCXHX8hEL3VArkxmvfOSs4MxsKpd2wrUmTnXyBCL7TW9vZk8NdPly0Mk2uFOPDqOYfj8F7FwISEh8bSwUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVoMzvkkR97oGlXc+Ope81vf7/Yx49zgm9yHKjseGhB6l3DQt5
	0cRpZe9J34iOWXb7hxDkpAdhIrrP25HNUTfSykdPIvwjqTVFPga4zfn16X1jG2RZZgc=
X-Gm-Gg: ASbGncvO+1IQs4CDEOzIOQlm1EIis07Dzy8pmcGYvHiftr09ni2jkCHcIHOJ5RpjtgW
	l9g03lviXyfKrKIXTnpF7SJLI1Y8FbnZAsAgeruVyaZsJTv+oZ9QtDryRpRsnB6gV8GmZt0/Tod
	oqgmZnKpPcTd3szGZAJmf3GNKNwW+fD12IAnuCF4v3VDYL/VjVyoWDUzOaKHH05F5xvt8FnvJC8
	oJgdLxcq9dtTqxYO5ItyWNrF2ge/8mypEJ0tcZVDqNO6ZfVIKDgGDomOil952ZRpQ+usMmNo+7R
	8b1XD+2SWjNhKzLmuEARnJGtUp++fZXAiMWybM4sY3BiIC4omlbeGUgZLr2+DDbNHaWVliOKbgO
	rxqt/Bfs9HfoatYIhn0gHtrggdAv4nvneVd1/q+YEKP+eRR17Vc3IvqL0apyNVUx6BF+g
X-Google-Smtp-Source: AGHT+IGR6BvCSuwozQuhF+JK63ZdSllhSvwjucskJLyJAXnOTc2Yf1K6fqw2IyjVv7b8YJWo3DFKzQ==
X-Received: by 2002:a17:907:9813:b0:ae6:efe1:5bb5 with SMTP id a640c23a62f3a-af2f67dff36mr337902766b.7.1753279446731;
        Wed, 23 Jul 2025 07:04:06 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d46ffsm1054830466b.42.2025.07.23.07.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:04:06 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 23 Jul 2025 16:03:38 +0200
Subject: [PATCH v3 1/3] ASoC: dt-bindings: qcom,q6afe: Document q6usb
 subnode
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-fp4-usb-audio-offload-v3-1-6be84ed4fc39@fairphone.com>
References: <20250723-fp4-usb-audio-offload-v3-0-6be84ed4fc39@fairphone.com>
In-Reply-To: <20250723-fp4-usb-audio-offload-v3-0-6be84ed4fc39@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753279445; l=1387;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=iFrv0UOBrWQDOMIVYCVEkyIJ0o38UILWsfNE6sREkpI=;
 b=Ztq41RZXSMGO6exUAOuQ4XQcdpBry6H1ciTLjtAknNQkm9moDrjoxqdKldMAFo0BxG/t8N6Qw
 UOlP27CPefLBV/wj79OId5uHt7EjrKLju9XrZCiuJZQRup7OWYCuFaK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the subnode for Q6USB, used for USB audio offloading.

Cc: Wesley Cheng <quic_wcheng@quicinc.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,q6afe.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml b/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
index 297aa362aa54ab41a956b3ceda73d4c7027d72a7..268f7073d7972da2ef46d36264c0f7d8f648071b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
@@ -29,6 +29,12 @@ properties:
     unevaluatedProperties: false
     description: Qualcomm DSP audio ports
 
+  usbd:
+    type: object
+    $ref: /schemas/sound/qcom,q6usb.yaml#
+    unevaluatedProperties: false
+    description: Qualcomm DSP USB audio ports
+
 required:
   - compatible
   - dais
@@ -64,5 +70,12 @@ examples:
                     qcom,sd-lines = <0 1 2 3>;
                 };
             };
+
+            usbd {
+                compatible = "qcom,q6usb";
+                #sound-dai-cells = <1>;
+                iommus = <&apps_smmu 0x180f 0x0>;
+                qcom,usb-audio-intr-idx = /bits/ 16 <2>;
+            };
         };
     };

-- 
2.50.1

