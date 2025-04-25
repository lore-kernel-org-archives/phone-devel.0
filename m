Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A43258CF2
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 11:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582047; cv=none; b=pmscYcFl20LU5Cn3ZTD2j60nTwaiwm0Do40yXAOgI2pDOOBS23YYo8sYPnC2cVy2997eoZ+umGd/1lE5OxL2oGcdnNUSe4kyDULWMeZsZjxXJTRY0QZub3P8JjFsA36q5HHeaxG6qeiVsItGHIleajslyshifk6FRXuTuVYQeYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582047; c=relaxed/simple;
	bh=hZja3DhWp4DqnrVBJnrg1UV+uBVj5+fTNllqLDvHy7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eooIys4uGEYswy6SJVychuojjFsijGfdBdZbuoYlrjdYcpeppCSQERICyKngv1rfRAkNhVkkPNeeTHKTJAt8gQ2SpvxhQFjZGL4FO+V4HH7Dd/Vdyt2rBTnlt0WojdSG0VPbO3vJTC6TQWnGNY97TfbgR9jnTSPno8VmfhaMjk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Z4PUtJxJ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Z4PUtJxJ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-acbb48bad09so388727866b.0
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 04:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582044; x=1746186844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SK5p8vc5OlPwJ0lqNJy5P1rG3nKiW25/X8diyPQdNQ=;
        b=Z4PUtJxJO4gfCLPHreo8OzCCP/6I/FAAXoZyCx4vPtah7PJJ4/KLMBo0IEWkkqEyZ+
         5xlzuJ5AzJ4sUFLETHZpZ8HXfDdEfcznrzAwQimHdJyn5EnSNespk4cbGGodRfce6IoR
         i6vsmHtOEpGkPTfbNd/1YE/kdh83O0qrRyFay89sOlRYO1WYNFumrwhDXOYh3p7ouBSg
         78IIuwQbi5H8WkFuX0ZI95tr/hx/nNZTUoDMES8+6l7/Xa7XX9eYKXaMs7UDuUuquWVn
         ovfoYQtXz3dUswxjueyimsPY3Cx48OB8+uYjoAkZZ42MwX/bLQtUZwGC03ATDJm/j7Ci
         q9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582044; x=1746186844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SK5p8vc5OlPwJ0lqNJy5P1rG3nKiW25/X8diyPQdNQ=;
        b=s80ek/rsFieMSauxmHlr5BdHoy//YMTh/RQVP1vI16CuiGrZ9Mek6TDFZ1Ofhx7rkZ
         jueHc4uW5P28OlxsMpuY8Xm8NmHgkY1zYjO8/WlcAN98cf8vXha7B4DtyC8xgb/8QfxO
         xbwkOPHrxFJ+VzAEaWWFC2v4CNWCLmeOQufG7m73/zcQMXkhW9K0i0ZIzJk84CqY3QgR
         Rot037c3dKIHvY4fj0+mHQ9b1rthto4uxo5LsJYla8GRTop5OdnyTIVPfSvri1fhQnOX
         QnM8FpEcvIuj67LoXFsOc/SBQSDLUpXe5fUhUyiAdbudm0pPT6BipmViJdHWxakWSGsl
         pCuA==
X-Forwarded-Encrypted: i=1; AJvYcCV9hWMuKfAzSqq5X4PFBZJxVzVvEKaVPFoVPaQd7VKzMT9jF3JyaSabFlVTwizYdIgcPAPziqklBkK83g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzloPKI6nol05tz/4SVn1F+5KNsH+VGjNcQTKK+RQvfJv+ITkHB
	XJW8WUmY9bvosrja3OB9ensqYvy1zmaV7O+3lFDwJ3CHv3pcjTaYPJ+phlGMsHM=
X-Gm-Gg: ASbGncsyH5kUWlmOHXnO1DUl9isjj2FNSJip8zKmb13ow0LAuiYipGfyegVOlhfhGak
	iorUn0ZqT6kmixrfBWC04MwhpNUgzhdfZY8jwsVQMX7NZ/Pm/QBVGJICoSMsOPV3bCml9qgYBXQ
	fSXr8Uo9x84pnS3j5kQXoMreaO4jpsxmIOTOL4x1HyBxt69YZfHGz2TOUHoCH1q+PMgFeLBSf0h
	XQaWXH+5+pHEDCkJKAeMfVD1/1r7QLIy/UKCk5sgH6IktfNf3QNRkG8NPGgdHENBaAJNpCfPegs
	Y70n4CTO4OuUYh1yEPeq5jqEVTXUUv4EQmUeYozet7NEJD85GSGSO+Zd8zPGQo43K4w2o1e2q5t
	XAOIzRhjnVilgOh8X4iJQYv59LR9DpL1A5F5MMuWkiujanpu1qQ2D/Qs8
X-Google-Smtp-Source: AGHT+IH8pJR0qES2zOkoM2zky7c3n1R1b6HaoctvcHOLcvJ4CDgnk1ffCK87cpuY4+1yTGln4yQNJg==
X-Received: by 2002:a17:907:1b25:b0:acb:b6c9:90af with SMTP id a640c23a62f3a-ace7108a929mr190169466b.16.1745582044400;
        Fri, 25 Apr 2025 04:54:04 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:54:03 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:50 +0200
Subject: [PATCH 11/11] arm64: dts: qcom: sm8350: Use q6asm defines for reg
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-11-28308e2ce7d4@fairphone.com>
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
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 04a30df4362b65594c073b758f25bf2ae0398541..f2e12da13e686e68071ced0e7251b727d08061b5 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -22,6 +22,7 @@
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/thermal/thermal.h>
 #include <dt-bindings/interconnect/qcom,sm8350.h>
 
@@ -1957,15 +1958,15 @@ q6asmdai: dais {
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

