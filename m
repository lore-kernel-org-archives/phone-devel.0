Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5986C25395B
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 11:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582043; cv=none; b=LIxB52Ncw7154PF9mOusOpTnpoDDPR9Xjb2CLx6jGXwBqPMdBJeAiwKjWjDa30lCfKfSKZm8660NDChgtHedndYOekV2CA8hCEHjdJ4g/s4HNh9wuyJmiQsAXwfQYP0QPxiOdbBVQh5APuoC278Fk/5/4XmKL6EoAqSSt+o63Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582043; c=relaxed/simple;
	bh=qe+W3z14Vw2wfaOu9ITi7s91Y9kEJeXglwzkNhG8nIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mWIkgBMCl1Qe5JUdatg2Bo0XNjMdlN35BtJHJHi8OT/SSY2P9NUliLz8lAKwOyHHaHz737saEWlzlqVxdOzrilq2hj/u3zpfdqh1FJpfno+DwY42VApFjlRxXktVMjER5kDxy5kmlOK9AM6iAjfkXYCZHF+iTeorwLlPg4cm2rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=casTvpNw; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="casTvpNw"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso2717335a12.3
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 04:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582039; x=1746186839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFVqEvZNZmgDIHITifK+m8w6rPETJxy3/wEVnk7igpo=;
        b=casTvpNwishGqauGcKW2lWRRZN93gw1ihJaH26DBRp185E2rzHEPdxs0e//qRppPtv
         wPmzMkkyqnZ9oYQrZM7jDNB4pPvc6IUR5QG2y3a3lB8QtENLmLMHQMJ/IlgYPOYBoDC8
         7NhdOna9pfj6hWdHlnP6VpSPPcO1mTb7Q6Wc2U7UBDWW5ltg4AF8UqHYTojP06t10Vxx
         eg/C6ghD56cXrwc+UzbHVDnBrOIaGQGr78HXusTefN1zHuggYdCER43pMOGzHPm9d+he
         m4LsQTkJx4NIVVyvawXLymqLt1gwQ2qLIXdwNN/qb+dhu8P/bm6C0LFnpSxOXCYpT1dr
         PQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582039; x=1746186839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFVqEvZNZmgDIHITifK+m8w6rPETJxy3/wEVnk7igpo=;
        b=WXgRj1esn4NcQ5ZLtKDUBBOpcZV2Sjxd7EnGWqq6evU8Lp/1Xn8SdGSN+D+JB2CLIN
         7GrO2NigNyt2vN8P6hpaz/CvYoOfrTq8vf83unABQZmkYH6+D+TqGs29pO4UJN7hesXC
         nqSdmZan7mxs/pNxoCCpCTtVZI2RGqAB5jHuCtgZh00A0UP7j2whdlBxL5mL+yH2LDSN
         RxS5o6mE3M79+iajVs5QDovYPNPhstEoffgqgbV9XUqYTC6Wx3SqHMZTSKkohhRqKWoA
         0B9bL4bn/iiNqBbzi4cgkuJ0wwUxSg0Fs5p9e9eDuWsRKqtwEmjlf1jzh047PzG6+J6f
         5edQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC2infI3SM+dOXwQuRQKLc4S+wA5C+wq9jo+ty4MvErQq4bJOhL91OAsic2jN0HCl9AOA86nEmp3BYUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqd3hMcIv/MBH3lYG9QVFnijhxAzUiBUT5tacLUSlq9td+tRH+
	PzuNnaKhf0Kka6Ul5hrlkq+Pz239xqzJzZezn44mHbboCFCjNDawor/ksFa357Y=
X-Gm-Gg: ASbGnctep4SXBBtd/MOn+Z1CFXRjN2UMrvyybcTtfSbd/DRRIOJxjhs/TINg+0NlxqJ
	9qnZsptfVteZ1gQpD9uTIK1J3euBZQ1T+r9lnMdOchFKQ9k8JiQN2fS3VX00Zqvy2uGTdR5kbeA
	0Ua/XIeYvh0R4eDpPxC2HXGhxwS19IDsk0ETjLkPd4815bzPOlohJgdLYyimMaocfg75K7T9mZZ
	UfetDh9edUrIG7P4h+HZ8O+lE2xhDGv7HGtuje3CelcPAe6w+9w1hKZN0TmUr6txrXiHe4nd4K9
	4pTn+36nXqkmLuHt5TgJ65jWUxCkfL1RwW/NZxF7y60y/MKqXPMD+JL6h32ZY9ZTYlY1j6lZ048
	R1SkJQ6bBTzOWDjvf6hpXuHHBpbS+ZOCRlnorVFdz7298c/OXt0iLwrLfeVQo2Oi3jV4=
X-Google-Smtp-Source: AGHT+IFydxzM4xveDiHNxirQ0FhZcj5TUtv/EQfa5vwmL4iBPwaxKfYgWV+76QHSL615mmQU9XFPrQ==
X-Received: by 2002:a17:907:72d5:b0:ac4:5f1:a129 with SMTP id a640c23a62f3a-ace710c6430mr204966166b.15.1745582039433;
        Fri, 25 Apr 2025 04:53:59 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:53:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:46 +0200
Subject: [PATCH 07/11] arm64: dts: qcom: sc7280: Use q6asm defines for reg
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-7-28308e2ce7d4@fairphone.com>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
In-Reply-To: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
readable. No functional change intended.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8e86d75cc6b4929f6cf9592a3f1ae591a19e6d78..b898b2cc8ffcf1bc54493ba244240573981c82f2 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -28,6 +28,7 @@
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,lpass.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -3833,15 +3834,15 @@ q6asmdai: dais {
 							iommus = <&apps_smmu 0x1801 0x0>;
 
 							dai@0 {
-								reg = <0>;
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 							};
 
 							dai@1 {
-								reg = <1>;
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 							};
 
 							dai@2 {
-								reg = <2>;
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 							};
 						};
 					};

-- 
2.49.0

